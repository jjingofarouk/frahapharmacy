import { signOut } from '@lib/auth';
import { redirect } from 'next/navigation';

export default async function Logout() {
  await signOut();
  redirect('/auth/login');
}