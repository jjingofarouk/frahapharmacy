import { PrismaClient } from '@prisma/client';
import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';
import AdminSidebar from '@components/AdminSidebar';
import Card from '@components/ui/Card';

const prisma = new PrismaClient();

export default async function Inventory() {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }

  const logs = await prisma.inventoryLog.findMany({
    include: { product: true, user: true },
    orderBy: { createdAt: 'desc' },
  });

  return (
    <div className="flex min-h-screen bg-neutral-light">
      <AdminSidebar />
      <div className="flex-1 p-8">
        <h1 className="text-3xl font-bold text-dark-blue mb-6">Inventory Logs</h1>
        <div className="space-y-6">
          {logs.map(log => (
            <Card key={log.id}>
              <p className="text-neutral-dark">Product: {log.product.name}</p>
              <p className="text-neutral-dark">Change: {log.quantityChange > 0 ? '+' : ''}{log.quantityChange}</p>
              <p className="text-neutral-dark">Reason: {log.reason}</p>
              <p className="text-neutral-dark">By: {log.user?.name || 'System'}</p>
              <p className="text-neutral-dark">Date: {new Date(log.createdAt).toLocaleString()}</p>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
}