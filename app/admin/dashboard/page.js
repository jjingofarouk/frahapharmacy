import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';
import AdminSidebar from '@components/AdminSidebar';

export default async function Dashboard() {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }

  return (
    <div className="flex min-h-screen bg-neutral-light">
      <AdminSidebar />
      <div className="flex-1 p-8">
        <h1 className="text-3xl font-bold text-dark-blue">Admin Dashboard</h1>
        <p className="mt-4 text-neutral-dark">Welcome, {session.user.name}! Manage products, categories, orders, and inventory.</p>
      </div>
    </div>
  );
}