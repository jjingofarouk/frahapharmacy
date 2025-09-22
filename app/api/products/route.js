import { PrismaClient } from '@prisma/client';
import { NextResponse } from 'next/server';
import { z } from 'zod';

const prisma = new PrismaClient();

const allowedOrigins = [
  process.env.NEXT_PUBLIC_FRONTEND_URL || 'https://frahapharmacyy.vercel.app',
  process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : null,
].filter(Boolean);

const corsHeaders = {
  'Access-Control-Allow-Origin': allowedOrigins.join(', '),
  'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
};

// Input validation schema
const productSchema = z.object({
  name: z.string().min(1, 'Name is required'),
  description: z.string().optional(),
  price: z.number().positive('Price must be positive'),
  stock: z.number().int().nonnegative('Stock must be a non-negative integer'),
  imageUrl: z.string().url().optional().or(z.literal('')),
  categoryIds: z.array(z.number()).optional(),
});

export async function OPTIONS() {
  return new NextResponse(null, { status: 204, headers: corsHeaders });
}

export async function GET(request) {
  try {
    const { searchParams } = new URL(request.url);
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '20');
    const search = searchParams.get('search') || '';
    const category = searchParams.get('category') || '';

    const skip = (page - 1) * limit;

    const where = {
      AND: [
        search ? {
          OR: [
            { name: { contains: search, mode: 'insensitive' } },
            { description: { contains: search, mode: 'insensitive' } },
          ],
        } : {},
        category && category !== 'all' ? {
          categories: {
            some: {
              category: {
                name: { equals: category, mode: 'insensitive' },
              },
            },
          },
        } : {},
      ],
    };

    const [products, totalCount] = await Promise.all([
      prisma.product.findMany({
        where,
        include: {
          categories: {
            include: { category: true },
          },
          orders: {
            select: { id: true },
          },
          inventoryLogs: {
            select: { id: true, quantityChange: true, reason: true, createdAt: true },
          },
        },
        skip,
        take: limit,
        orderBy: { createdAt: 'desc' },
      }),
      prisma.product.count({ where }),
    ]);

    const formattedProducts = products.map(product => ({
      ...product,
      categories: product.categories.map(pc => pc.category),
    }));

    return NextResponse.json(
      {
        products: formattedProducts,
        totalCount,
        page,
        totalPages: Math.ceil(totalCount / limit),
      },
      { headers: corsHeaders }
    );
  } catch (error) {
    console.error('Error fetching products:', error);
    return NextResponse.json(
      {
        error: 'Failed to fetch products',
        details: process.env.NODE_ENV === 'development' ? error.message : undefined,
      },
      { status: 500, headers: corsHeaders }
    );
  }
}

export async function POST(request) {
  try {
    const body = await request.json();
    const validatedData = productSchema.parse(body);

    const product = await prisma.product.create({
      data: {
        name: validatedData.name,
        description: validatedData.description,
        price: validatedData.price,
        stock: validatedData.stock,
        imageUrl: validatedData.imageUrl,
        categories: validatedData.categoryIds ? {
          create: validatedData.categoryIds.map(id => ({
            categoryId: id,
          })),
        } : undefined,
      },
      include: {
        categories: {
          include: {
            category: true,
          },
        },
      },
    });

    const formattedProduct = {
      ...product,
      categories: product.categories.map(pc => pc.category),
    };

    return NextResponse.json(formattedProduct, { status: 201, headers: corsHeaders });
  } catch (error) {
    console.error('Error creating product:', error);
    if (error instanceof z.ZodError) {
      return NextResponse.json(
        { error: 'Invalid input', details: error.errors },
        { status: 400, headers: corsHeaders }
      );
    }
    return NextResponse.json(
      {
        error: 'Failed to create product',
        details: process.env.NODE_ENV === 'development' ? error.message : undefined,
      },
      { status: 500, headers: corsHeaders }
    );
  }
}