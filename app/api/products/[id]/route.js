import { PrismaClient } from '@prisma/client';
import { NextResponse } from 'next/server';
import { getServerSession } from '@lib/auth';

const prisma = new PrismaClient();

const allowedOrigins = [
  process.env.NEXT_PUBLIC_FRONTEND_URL || 'https://frahapharmacyy.vercel.app',
  process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : null,
].filter(Boolean);

const corsHeaders = {
  'Access-Control-Allow-Origin': allowedOrigins.join(', '),
  'Access-Control-Allow-Methods': 'GET,DELETE,OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
};

export async function OPTIONS() {
  return new NextResponse(null, { status: 204, headers: corsHeaders });
}

export async function GET(request, { params }) {
  try {
    const product = await prisma.product.findUnique({
      where: { id: parseInt(params.id) },
      include: {
        categories: {
          include: { category: true },
        },
        orders: {
          select: { id: true, quantity: true, createdAt: true },
        },
        inventoryLogs: {
          select: { id: true, quantityChange: true, reason: true, createdAt: true },
          orderBy: { createdAt: 'desc' },
        },
      },
    });

    if (!product) {
      return NextResponse.json(
        { error: 'Product not found' },
        { status: 404, headers: corsHeaders }
      );
    }

    const formattedProduct = {
      ...product,
      categories: product.categories.map(pc => pc.category),
    };

    return NextResponse.json(formattedProduct, { headers: corsHeaders });
  } catch (error) {
    console.error('Error fetching product:', error);
    return NextResponse.json(
      {
        error: 'Failed to fetch product',
        details: process.env.NODE_ENV === 'development' ? error.message : undefined,
      },
      { status: 500, headers: corsHeaders }
    );
  }
}

export async function DELETE(request, { params }) {
  try {
    const session = await getServerSession();
    if (!session || session.user.role !== 'admin') {
      return NextResponse.json(
        { error: 'Unauthorized' },
        { status: 401, headers: corsHeaders }
      );
    }

    await prisma.$transaction([
      prisma.productCategory.deleteMany({ where: { productId: parseInt(params.id) } }),
      prisma.orderItem.deleteMany({ where: { productId: parseInt(params.id) } }),
      prisma.inventoryLog.deleteMany({ where: { productId: parseInt(params.id) } }),
      prisma.product.delete({ where: { id: parseInt(params.id) } }),
    ]);

    return NextResponse.json(
      { message: 'Product deleted successfully' },
      { headers: corsHeaders }
    );
  } catch (error) {
    console.error('Error deleting product:', error);
    return NextResponse.json(
      {
        error: 'Failed to delete product',
        details: process.env.NODE_ENV === 'development' ? error.message : undefined,
      },
      { status: 500, headers: corsHeaders }
    );
  }
}