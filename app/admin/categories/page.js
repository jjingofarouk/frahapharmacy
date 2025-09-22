import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';
import AdminSidebar from '@components/AdminSidebar';
import Link from 'next/link';
import Card from '@components/ui/Card';

const prisma = new PrismaClient();

export default async function Categories() {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }

  const categories = await prisma.category.findMany();

  return (
    <div className="flex min-h-screen bg-neutral-light">
      <AdminSidebar />
      <div className="flex-1 p-8">
        <div className="flex justify-between items-center mb-6">
          <h1 className="text-3xl font-bold text-dark-blue">Categories</h1>
          <Link href="/admin/categories/add">
            <button className="bg-pharmacy-green text-white px-4 py-2 rounded">Add Category</button>
          </Link>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {categories.map(category => (
            <Card key={category.id}>
              <h3 className="text-lg font-semibold text-dark-blue">{category.name}</h3>
              <p className="text-neutral-dark">{category.description || 'No description'}</p>
              <Link href={`/admin/categories/edit/${category.id}`}>
                <button className="mt-2 text-pharmacy-green">Edit</button>
              </Link>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
}