import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';
import AdminSidebar from '@components/AdminSidebar';
import Modal from '@components/ui/Modal';
import Button from '@components/ui/Button';

const prisma = new PrismaClient();

export default async function DeleteProduct({ params }) {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }

  const product = await prisma.product.findUnique({
    where: { id: parseInt(params.id) },
  });

  if (!product) {
    redirect('/admin/products');
  }

  async function handleDelete() {
    'use server';
    await prisma.product.delete({
      where: { id: parseInt(params.id) },
    });
    redirect('/admin/products');
  }

  return (
    <div className="flex min-h-screen bg-neutral-light">
      <AdminSidebar />
      <div className="flex-1 p-8">
        <h1 className="text-3xl font-bold text-dark-blue mb-6">Delete Product</h1>
        <Modal>
          <p className="text-neutral-dark mb-4">Are you sure you want to delete "{product.name}"?</p>
          <form action={handleDelete}>
            <Button type="submit" className="bg-error-red text-white">Confirm Delete</Button>
          </form>
        </Modal>
      </div>
    </div>
  );
}