import { getServerSession } from '@lib/auth';
import { redirect } from 'next/navigation';

export default async function AdminLayout({ children }) {
  const session = await getServerSession();
  if (!session || session.user.role !== 'admin') {
    redirect('/auth/login');
  }

  return <>{children}</>;
}