import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';
import AdminSidebar from '@components/AdminSidebar';
import CategoryForm from '@components/CategoryForm';

const prisma = new PrismaClient();

export default async function EditCategory({ params }) {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }

  const category = await prisma.category.findUnique({
    where: { id: parseInt(params.id) },
  });

  if (!category) {
    redirect('/admin/categories');
  }

  return (
    <div className="flex min-h-screen bg-neutral-light">
      <AdminSidebar />
      <div className="flex-1 p-8">
        <h1 className="text-3xl font-bold text-dark-blue mb-6">Edit Category</h1>
        <CategoryForm category={category} />
      </div>
    </div>
  );
}