import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { NextResponse } from 'next/server';

const prisma = new PrismaClient();

export async function GET(request, { params }) {
  try {
    const product = await prisma.product.findUnique({
      where: { id: parseInt(params.id) },
      include: { categories: { include: { category: true } } }, // Include categories
    });
    if (!product) {
      return NextResponse.json({ error: 'Product not found' }, { status: 404 });
    }
    // Transform categories for frontend
    const formattedProduct = {
      ...product,
      categories: product.categories.map(pc => pc.category),
    };
    return NextResponse.json(formattedProduct);
  } catch (error) {
    return NextResponse.json({ error: 'Failed to fetch product: ' + error.message }, { status: 500 });
  }
}

export async function DELETE(request, { params }) {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }
  try {
    await prisma.productCategory.deleteMany({ where: { productId: parseInt(params.id) } });
    await prisma.product.delete({ where: { id: parseInt(params.id) } });
    return NextResponse.json({ message: 'Product deleted' });
  } catch (error) {
    return NextResponse.json({ error: 'Failed to delete product: ' + error.message }, { status: 500 });
  }
}