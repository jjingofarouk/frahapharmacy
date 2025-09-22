const { PrismaClient } = require('@prisma/client');
const fs = require('fs');
const path = require('path');

const prisma = new PrismaClient();

/**
 * Parse price from string format (e.g., "UGX 88,000" → 88000)
 */
function parsePrice(priceString) {
  if (!priceString) return 0;
  const cleanPrice = priceString.replace(/[^0-9.]/g, '');
  return parseFloat(cleanPrice) || 0;
}

/**
 * Create all unique categories from the products data
 */
async function createCategories(products) {
  console.log('\n📂 Creating categories...');
  
  // Collect all unique categories
  const categorySet = new Set();
  products.forEach(product => {
    if (product.categories && Array.isArray(product.categories)) {
      product.categories.forEach(cat => {
        if (cat && cat.trim()) {
          categorySet.add(cat.trim());
        }
      });
    }
  });
  
  console.log(`Found ${categorySet.size} unique categories`);
  
  const categoryMap = new Map();
  let categoryCount = 0;
  
  // Create categories one by one with progress
  for (const categoryName of categorySet) {
    try {
      const category = await prisma.category.upsert({
        where: { name: categoryName },
        update: {
          description: `Products in ${categoryName} category`
        },
        create: {
          name: categoryName,
          description: `Products in ${categoryName} category`,
        },
      });
      
      categoryMap.set(categoryName, category.id);
      categoryCount++;
      
      if (categoryCount % 5 === 0 || categoryCount === categorySet.size) {
        console.log(`✓ Created/updated ${categoryCount}/${categorySet.size} categories`);
      }
      
    } catch (error) {
      console.error(`✗ Failed to create category: ${categoryName}`, error.message);
    }
  }
  
  console.log(`✅ Categories completed: ${categoryCount} total`);
  return categoryMap;
}

/**
 * Create a single product with error handling
 */
async function createProduct(product, index, total, categoryMap) {
  try {
    const price = parsePrice(product.price);
    
    // Create the product
    const createdProduct = await prisma.product.upsert({
      where: { name: product.name },
      update: {
        description: product.description || '',
        price: price,
        // Don't update imageUrl in case we already have one
      },
      create: {
        name: product.name,
        description: product.description || '',
        price: price,
        stock: 100, // Default stock
        imageUrl: null, // We'll handle images later
      },
    });
    
    // Handle categories if they exist
    if (product.categories && Array.isArray(product.categories)) {
      const validCategories = product.categories
        .map(cat => cat.trim())
        .filter(cat => cat && categoryMap.has(cat));
      
      if (validCategories.length > 0) {
        // First, remove existing category relationships for this product
        await prisma.productCategory.deleteMany({
          where: { productId: createdProduct.id }
        });
        
        // Then create new relationships
        const categoryConnections = validCategories.map(categoryName => ({
          productId: createdProduct.id,
          categoryId: categoryMap.get(categoryName),
        }));
        
        await prisma.productCategory.createMany({
          data: categoryConnections,
          skipDuplicates: true,
        });
      }
    }
    
    console.log(`✓ [${index + 1}/${total}] Seeded product: ${product.name}`);
    return { success: true, product: product.name };
    
  } catch (error) {
    console.error(`✗ [${index + 1}/${total}] Failed to seed: ${product.name} - ${error.message}`);
    return { success: false, product: product.name, error: error.message };
  }
}

/**
 * Main seeding function
 */
async function main() {
  const startTime = Date.now();
  
  console.log('🚀 Starting database seeding (Products and Categories only)...');
  console.log('📝 Note: Image URLs will be processed separately later\n');
  
  try {
    // Read and validate JSON file
    const jsonPath = path.join(process.cwd(), 'products.json');
    if (!fs.existsSync(jsonPath)) {
      throw new Error('products.json file not found in the current directory');
    }
    
    let data;
    try {
      const fileContent = fs.readFileSync(jsonPath, 'utf8');
      data = JSON.parse(fileContent);
    } catch (parseError) {
      throw new Error(`Failed to parse products.json: ${parseError.message}`);
    }
    
    if (!Array.isArray(data)) {
      throw new Error('products.json should contain an array of products');
    }
    
    console.log(`📦 Found ${data.length} products to process\n`);
    
    // Step 1: Create all categories first
    const categoryMap = await createCategories(data);
    
    // Step 2: Create all products with progress tracking
    console.log('\n🏭 Creating products...');
    
    const results = {
      success: 0,
      failed: 0,
      errors: []
    };
    
    // Process products sequentially to avoid overwhelming the database
    for (let i = 0; i < data.length; i++) {
      const product = data[i];
      
      // Skip products with invalid names
      if (!product.name || typeof product.name !== 'string' || !product.name.trim()) {
        console.error(`✗ [${i + 1}/${data.length}] Skipping product with invalid name`);
        results.failed++;
        continue;
      }
      
      const result = await createProduct(product, i, data.length, categoryMap);
      
      if (result.success) {
        results.success++;
      } else {
        results.failed++;
        results.errors.push({
          product: result.product,
          error: result.error
        });
      }
      
      // Progress update every 50 products
      if ((i + 1) % 50 === 0 || (i + 1) === data.length) {
        const progress = Math.round(((i + 1) / data.length) * 100);
        console.log(`\n📊 Progress: ${progress}% (${results.success} successful, ${results.failed} failed)`);
      }
      
      // Small delay to prevent overwhelming the database
      if (i % 10 === 0) {
        await new Promise(resolve => setTimeout(resolve, 100));
      }
    }
    
    // Step 3: Cleanup orphaned relationships
    console.log('\n🧹 Cleaning up orphaned relationships...');
    const deletedRelations = await prisma.productCategory.deleteMany({
      where: {
        OR: [
          { 
            product: { 
              is: null 
            } 
          },
          { 
            category: { 
              is: null 
            } 
          }
        ]
      }
    });
    
    if (deletedRelations.count > 0) {
      console.log(`✓ Cleaned up ${deletedRelations.count} orphaned relationships`);
    }
    
    // Final statistics
    const duration = Math.round((Date.now() - startTime) / 1000);
    const minutes = Math.floor(duration / 60);
    const seconds = duration % 60;
    
    console.log('\n' + '='.repeat(60));
    console.log('✅ SEEDING COMPLETED SUCCESSFULLY!');
    console.log('='.repeat(60));
    console.log(`⏱️  Duration: ${minutes}m ${seconds}s`);
    console.log(`📂 Categories: ${categoryMap.size} created/updated`);
    console.log(`📦 Products: ${results.success} successful, ${results.failed} failed`);
    console.log(`📊 Success rate: ${Math.round((results.success / (results.success + results.failed)) * 100)}%`);
    console.log('='.repeat(60));
    
    // Log errors if any
    if (results.errors.length > 0) {
      console.log('\n⚠️  Failed products:');
      results.errors.slice(0, 10).forEach((error, index) => {
        console.log(`  ${index + 1}. ${error.product}: ${error.error}`);
      });
      
      if (results.errors.length > 10) {
        console.log(`  ... and ${results.errors.length - 10} more errors`);
      }
      
      // Save detailed error log
      const errorLogPath = path.join(process.cwd(), 'seeding_errors.json');
      fs.writeFileSync(errorLogPath, JSON.stringify(results.errors, null, 2));
      console.log(`\n📄 Detailed error log saved to: ${errorLogPath}`);
    }
    
    console.log('\n🎉 Database seeding completed! You can now run the image upload script separately.');
    
  } catch (error) {
    console.error('\n❌ FATAL ERROR during seeding:', error.message);
    console.error(error.stack);
    throw error;
  }
}

// Enhanced error handling and cleanup
process.on('SIGINT', async () => {
  console.log('\n\n⚠️  Received SIGINT. Cleaning up...');
  await prisma.$disconnect();
  process.exit(0);
});

process.on('SIGTERM', async () => {
  console.log('\n\n⚠️  Received SIGTERM. Cleaning up...');
  await prisma.$disconnect();
  process.exit(0);
});

// Execute with proper cleanup
main()
  .then(() => {
    console.log('\n✅ Seeding process completed successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n💥 Fatal error during seeding:', error);
    process.exit(1);
  })
  .finally(async () => {
    try {
      await prisma.$disconnect();
      console.log('\n👋 Database connection closed.');
    } catch (disconnectError) {
      console.error('Error disconnecting from database:', disconnectError);
    }
  });