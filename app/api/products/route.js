import { PrismaClient } from '@prisma/client';
import { NextResponse } from 'next/server';

const prisma = new PrismaClient();

export async function GET() {
  try {
    const products = await prisma.product.findMany({
      include: { 
        categories: { 
          include: { category: true } 
        } 
      },
    });
    
    const formattedProducts = products.map(product => ({
      ...product,
      categories: product.categories.map(pc => pc.category),
    }));
    
    return NextResponse.json(formattedProducts);
  } catch (error) {
  console.error('Error fetching products:', error.message, error.stack);
  return NextResponse.json(
    { error: 'Failed to fetch products', details: error.message }, 
    { status: 500 }
  );
}
}

export async function POST(request) {
  try {
    const { name, description, price, stock, imageUrl, categoryIds } = await request.json();
    
    const product = await prisma.product.create({
      data: {
        name,
        description,
        price,
        stock,
        imageUrl,
        categories: {
          create: categoryIds.map(id => ({
            categoryId: id,
          })),
        },
      },
      include: {
        categories: {
          include: {
            category: true
          }
        }
      }
    });
    
    return NextResponse.json(product);
  } catch (error) {
    console.error('Error creating product:', error);
    return NextResponse.json(
      { error: 'Failed to create product' }, 
      { status: 500 }
    );
  }
}