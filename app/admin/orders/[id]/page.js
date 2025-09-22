import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';
import AdminSidebar from '@components/AdminSidebar';
import Card from '@components/ui/Card';

const prisma = new PrismaClient();

export default async function OrderDetails({ params }) {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }

  const order = await prisma.order.findUnique({
    where: { id: parseInt(params.id) },
    include: { items: { include: { product: true } } },
  });

  if (!order) {
    redirect('/admin/orders');
  }

  return (
    <div className="flex min-h-screen bg-neutral-light">
      <AdminSidebar />
      <div className="flex-1 p-8">
        <h1 className="text-3xl font-bold text-dark-blue mb-6">Order #{order.id}</h1>
        <Card>
          <p className="text-neutral-dark">Total: ${order.total.toFixed(2)}</p>
          <p className="text-neutral-dark">Status: {order.status}</p>
          <p className="text-neutral-dark">Created: {new Date(order.createdAt).toLocaleString()}</p>
          <h3 className="text-lg font-semibold text-dark-blue mt-4">Items:</h3>
          <ul className="list-disc pl-5">
            {order.items.map(item => (
              <li key={item.id} className="text-neutral-dark">
                {item.product.name} x{item.quantity} - ${item.price.toFixed(2)}
              </li>
            ))}
          </ul>
        </Card>
      </div>
    </div>
  );
}