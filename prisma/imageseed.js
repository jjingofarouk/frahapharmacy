const { PrismaClient } = require('@prisma/client');
const fs = require('fs');
const path = require('path');
const cloudinary = require('cloudinary').v2;
// Import fetch - handle both Node 18+ and older versions
let fetch;
let isNativeFetch = false;
try {
  // Try to use built-in fetch (Node 18+)
  if (globalThis.fetch) {
    fetch = globalThis.fetch;
    isNativeFetch = true;
    console.log('✓ Using native fetch (Node.js 18+)');
  } else {
    // Fall back to node-fetch for older Node versions
    fetch = require('node-fetch');
    console.log('✓ Using node-fetch package');
  }
} catch (error) {
  // If globalThis.fetch doesn't exist, try node-fetch
  try {
    fetch = require('node-fetch');
    console.log('✓ Using node-fetch package');
  } catch (requireError) {
    console.error('❌ fetch is not available. Please install node-fetch or upgrade to Node.js 18+');
    console.error('Run: npm install node-fetch');
    process.exit(1);
  }
}
const pLimit = require('p-limit').default;

const prisma = new PrismaClient();

// Configure Cloudinary
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

// Create rate limiter to avoid overwhelming Cloudinary (reduced from 5 to 3 for more stability)
const uploadLimit = pLimit(3);

// Cache for uploaded images
const uploadedImagesCache = new Map();

/**
 * Upload image to Cloudinary with enhanced retry logic
 */
async function uploadImageToCloudinary(url, productName, productId) {
  // Check cache first
  if (uploadedImagesCache.has(url)) {
    console.log(`✓ Using cached image for: ${productName}`);
    return uploadedImagesCache.get(url);
  }

  const maxRetries = 3;
  let attempt = 0;
  
  while (attempt < maxRetries) {
    try {
      attempt++;
      
      // Fetch the image with timeout and proper headers
      let response;
      let timeout; // Declare timeout variable outside the if blocks
      
      if (typeof AbortController !== 'undefined') {
        // Use AbortController if available (Node 16+)
        const controller = new AbortController();
        timeout = setTimeout(() => controller.abort(), 45000);
        
        response = await fetch(url, { 
          signal: controller.signal,
          headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'image/*,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.9',
            'Cache-Control': 'no-cache',
            'Pragma': 'no-cache'
          }
        });
        
      } else {
        // Fallback for older Node versions
        response = await fetch(url, {
          timeout: 45000,
          headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'image/*,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.9',
            'Cache-Control': 'no-cache',
            'Pragma': 'no-cache'
          }
        });
      }
      
      // Clear timeout only if it was set
      if (timeout) {
        clearTimeout(timeout);
      }
      
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
      }
      
      const contentType = response.headers.get('content-type');
      if (!contentType || !contentType.startsWith('image/')) {
        throw new Error(`Invalid content type: ${contentType}`);
      }
      
      // Get buffer - handle both native fetch and node-fetch
      let buffer;
      if (isNativeFetch) {
        // Native fetch: use arrayBuffer() then convert to Buffer
        const arrayBuffer = await response.arrayBuffer();
        buffer = Buffer.from(arrayBuffer);
      } else {
        // node-fetch: use buffer() method
        buffer = await response.buffer();
      }
      
      if (buffer.length === 0) {
        throw new Error('Empty image buffer');
      }
      
      // Generate unique public_id
      const publicId = `pharmacy/${productName.replace(/[^a-zA-Z0-9]/g, '_').substring(0, 40)}_${productId}_${Date.now()}`;
      
      // Upload to Cloudinary
      const uploadResult = await new Promise((resolve, reject) => {
        const uploadStream = cloudinary.uploader.upload_stream(
          { 
            folder: 'pharmacy-app',
            public_id: publicId,
            resource_type: 'image',
            overwrite: false, // Don't overwrite existing images
            transformation: [
              { width: 800, height: 800, crop: 'limit' },
              { quality: 'auto:good' },
              { fetch_format: 'auto' }
            ],
            timeout: 60000 // 60 second timeout for upload
          },
          (error, result) => {
            if (error) {
              reject(new Error(`Cloudinary error: ${error.message}`));
            } else {
              resolve(result);
            }
          }
        );
        
        uploadStream.end(buffer);
      });
      
      const cloudinaryUrl = uploadResult.secure_url;
      uploadedImagesCache.set(url, cloudinaryUrl);
      
      return cloudinaryUrl;
      
    } catch (error) {
      console.error(`⚠️  Attempt ${attempt}/${maxRetries} failed for ${productName}: ${error.message}`);
      
      if (attempt === maxRetries) {
        console.error(`✗ Failed to upload image for: ${productName} after ${maxRetries} attempts`);
        return null;
      }
      
      // Exponential backoff
      const delay = Math.min(attempt * 3000, 10000); // Max 10 seconds delay
      await new Promise(resolve => setTimeout(resolve, delay));
    }
  }
  
  return null;
}

/**
 * Process images for a batch of products
 */
async function processImageBatch(products, batchNumber, totalBatches) {
  console.log(`\n📸 Processing image batch ${batchNumber}/${totalBatches} (${products.length} products)...`);
  
  const results = {
    success: 0,
    failed: 0,
    skipped: 0
  };
  
  for (let i = 0; i < products.length; i++) {
    const product = products[i];
    const overallIndex = product.overallIndex;
    
    try {
      // Skip if product already has an image URL in database
      const existingProduct = await prisma.product.findUnique({
        where: { id: product.id },
        select: { imageUrl: true, name: true }
      });
      
      if (!existingProduct) {
        console.log(`⚠️  [${overallIndex}] Product not found in database: ${product.name}`);
        results.failed++;
        continue;
      }
      
      if (existingProduct.imageUrl) {
        console.log(`⏭️  [${overallIndex}] Skipping ${product.name} - already has image`);
        results.skipped++;
        continue;
      }
      
      if (!product.image_url) {
        console.log(`⚠️  [${overallIndex}] No image URL for: ${product.name}`);
        results.failed++;
        continue;
      }
      
      // Upload image
      const cloudinaryUrl = await uploadLimit(() => 
        uploadImageToCloudinary(product.image_url, product.name, product.id)
      );
      
      if (cloudinaryUrl) {
        // Update product with image URL
        await prisma.product.update({
          where: { id: product.id },
          data: { imageUrl: cloudinaryUrl }
        });
        
        console.log(`✅ [${overallIndex}] Updated image for: ${product.name}`);
        results.success++;
      } else {
        console.log(`❌ [${overallIndex}] Failed to upload image for: ${product.name}`);
        results.failed++;
      }
      
    } catch (error) {
      console.error(`💥 [${overallIndex}] Error processing ${product.name}: ${error.message}`);
      results.failed++;
    }
  }
  
  return results;
}

/**
 * Main image upload function
 */
async function main() {
  console.log('🖼️  Starting image upload process...\n');
  
  const startTime = Date.now();
  
  try {
    // Read products from JSON
    const jsonPath = path.join(process.cwd(), 'products.json');
    if (!fs.existsSync(jsonPath)) {
      throw new Error('products.json file not found');
    }
    
    const productsData = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    console.log(`📦 Found ${productsData.length} products in JSON file`);
    
    // Get existing products from database
    console.log('🔍 Fetching products from database...');
    const dbProducts = await prisma.product.findMany({
      select: {
        id: true,
        name: true,
        imageUrl: true
      }
    });
    
    console.log(`💾 Found ${dbProducts.length} products in database`);
    
    // Match JSON products with database products
    const productsToProcess = [];
    let matchedCount = 0;
    
    for (let i = 0; i < productsData.length; i++) {
      const jsonProduct = productsData[i];
      const dbProduct = dbProducts.find(db => db.name === jsonProduct.name);
      
      if (dbProduct && jsonProduct.image_url) {
        productsToProcess.push({
          id: dbProduct.id,
          name: dbProduct.name,
          image_url: jsonProduct.image_url,
          overallIndex: i + 1,
          hasExistingImage: !!dbProduct.imageUrl
        });
        matchedCount++;
      }
    }
    
    console.log(`🎯 Matched ${matchedCount} products with image URLs`);
    console.log(`🖼️  ${productsToProcess.filter(p => !p.hasExistingImage).length} products need images`);
    console.log(`⏭️  ${productsToProcess.filter(p => p.hasExistingImage).length} products already have images`);
    
    if (productsToProcess.length === 0) {
      console.log('✅ No products need image processing!');
      return;
    }
    
    // Process in batches
    const batchSize = 25; // Smaller batches for more stable processing
    const totalBatches = Math.ceil(productsToProcess.length / batchSize);
    
    const overallResults = {
      success: 0,
      failed: 0,
      skipped: 0
    };
    
    for (let i = 0; i < productsToProcess.length; i += batchSize) {
      const batch = productsToProcess.slice(i, i + batchSize);
      const batchNumber = Math.floor(i / batchSize) + 1;
      
      const batchResults = await processImageBatch(batch, batchNumber, totalBatches);
      
      // Update overall results
      overallResults.success += batchResults.success;
      overallResults.failed += batchResults.failed;
      overallResults.skipped += batchResults.skipped;
      
      // Progress update
      const processedCount = i + batch.length;
      const progress = Math.round((processedCount / productsToProcess.length) * 100);
      
      console.log(`\n📊 Batch ${batchNumber}/${totalBatches} completed:`);
      console.log(`   Success: ${batchResults.success}, Failed: ${batchResults.failed}, Skipped: ${batchResults.skipped}`);
      console.log(`📈 Overall progress: ${progress}% (${processedCount}/${productsToProcess.length})`);
      
      // Longer pause between batches to be respectful to Cloudinary
      if (batchNumber < totalBatches) {
        console.log('⏸️  Pausing for 3 seconds before next batch...');
        await new Promise(resolve => setTimeout(resolve, 3000));
      }
    }
    
    // Final summary
    const duration = Math.round((Date.now() - startTime) / 1000);
    const minutes = Math.floor(duration / 60);
    const seconds = duration % 60;
    
    console.log('\n' + '='.repeat(60));
    console.log('🎉 IMAGE UPLOAD PROCESS COMPLETED!');
    console.log('='.repeat(60));
    console.log(`⏱️  Duration: ${minutes}m ${seconds}s`);
    console.log(`✅ Successfully uploaded: ${overallResults.success} images`);
    console.log(`❌ Failed uploads: ${overallResults.failed} images`);
    console.log(`⏭️  Skipped (already had images): ${overallResults.skipped} products`);
    console.log(`💾 Cached images: ${uploadedImagesCache.size}`);
    
    const totalProcessed = overallResults.success + overallResults.failed;
    if (totalProcessed > 0) {
      const successRate = Math.round((overallResults.success / totalProcessed) * 100);
      console.log(`📊 Success rate: ${successRate}%`);
    }
    
    console.log('='.repeat(60));
    
  } catch (error) {
    console.error('\n💥 FATAL ERROR during image processing:', error.message);
    console.error(error.stack);
    throw error;
  }
}

// Cleanup handlers
process.on('SIGINT', async () => {
  console.log('\n\n⚠️  Received SIGINT. Cleaning up...');
  await prisma.$disconnect();
  process.exit(0);
});

// Execute
main()
  .then(() => {
    console.log('\n✨ Image upload process completed successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n💥 Fatal error:', error);
    process.exit(1);
  })
  .finally(async () => {
    try {
      await prisma.$disconnect();
      console.log('\n👋 Database connection closed.');
    } catch (err) {
      console.error('Error disconnecting:', err);
    }
  });