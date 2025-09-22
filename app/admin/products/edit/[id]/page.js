import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';
import AdminSidebar from '@components/AdminSidebar';
import ProductForm from '@components/ProductForm';

const prisma = new PrismaClient();

export default async function EditProduct({ params }) {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }
  const product = await prisma.product.findUnique({
    where: { id: parseInt(params.id) },
    include: { categories: { include: { category: true } } }, // Fixed include
  });
  if (!product) {
    redirect('/admin/products');
  }
  const formattedProduct = {
    ...product,
    categories: product.categories.map(pc => pc.category),
  };

  return (
    <div className="flex min-h-screen bg-neutral-light">
      <AdminSidebar />
      <div className="flex-1 p-8">
        <h1 className="text-3xl font-bold text-dark-blue mb-6">Edit Product</h1>
        <ProductForm product={formattedProduct} />
      </div>
    </div>
  );
}