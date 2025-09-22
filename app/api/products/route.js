import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { NextResponse } from 'next/server';

const prisma = new PrismaClient();

export async function GET() {
  try {
    const products = await prisma.product.findMany({
      include: { categories: { include: { category: true } } },
    });
    const formattedProducts = products.map(product => ({
      ...product,
      categories: product.categories.map(pc => pc.category),
    }));
    return NextResponse.json(formattedProducts);
  } catch (error) {
    return NextResponse.json({ error: 'Failed to fetch products: ' + error.message }, { status: 500 });
  }
}

export async function POST(request) {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }
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
    });
    return NextResponse.json(product);
  } catch (error) {
    return NextResponse.json({ error: 'Failed to create product: ' + error.message }, { status: 500 });
  }
}

export async function PUT(request) {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }
  try {
    const { id, name, description, price, stock, imageUrl, categoryIds } = await request.json();
    // Update product
    const product = await prisma.product.update({
      where: { id: parseInt(id) },
      data: { name, description, price, stock, imageUrl },
    });
    // Delete existing category associations
    await prisma.productCategory.deleteMany({
      where: { productId: parseInt(id) },
    });
    // Create new category associations
    await prisma.productCategory.createMany({
      data: categoryIds.map(categoryId => ({
        productId: parseInt(id), // Fixed: Use product id
        categoryId,
      })),
    });
    return NextResponse.json(product);
  } catch (error) {
    return NextResponse.json({ error: 'Failed to update product: ' + error.message }, { status: 500 });
  }
}