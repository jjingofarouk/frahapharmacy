import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';
import AdminSidebar from '@components/AdminSidebar';
import ProductCard from '@components/ProductCard';
import Link from 'next/link';

const prisma = new PrismaClient();

export default async function Products() {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }
  const products = await prisma.product.findMany({
    include: { categories: { include: { category: true } } }, // Fixed include
  });
  const formattedProducts = products.map(product => ({
    ...product,
    categories: product.categories.map(pc => pc.category),
  }));

  return (
    <div className="flex min-h-screen bg-neutral-light">
      <AdminSidebar />
      <div className="flex-1 p-8">
        <div className="flex justify-between items-center mb-6">
          <h1 className="text-3xl font-bold text-dark-blue">Products</h1>
          <Link href="/admin/products/add">
            <button className="bg-pharmacy-green text-white px-4 py-2 rounded">Add Product</button>
          </Link>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {formattedProducts.map(product => (
            <ProductCard key={product.id} product={product} admin />
          ))}
        </div>
      </div>
    </div>
  );
}