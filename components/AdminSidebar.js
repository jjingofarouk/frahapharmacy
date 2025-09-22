'use client';
import Link from 'next/link';
import { LogOut } from 'lucide-react';

export default function AdminSidebar() {
  return (
    <div className="w-64 bg-dark-blue text-white p-6 flex flex-col">
      <h2 className="text-2xl font-bold mb-8">Admin Panel</h2>
      <nav className="space-y-4 flex-1">
        <Link href="/admin/dashboard" className="block hover:bg-pharmacy-green p-2 rounded">Dashboard</Link>
        <Link href="/admin/products" className="block hover:bg-pharmacy-green p-2 rounded">Products</Link>
        <Link href="/admin/categories" className="block hover:bg-pharmacy-green p-2 rounded">Categories</Link>
        <Link href="/admin/orders" className="block hover:bg-pharmacy-green p-2 rounded">Orders</Link>
        <Link href="/admin/inventory" className="block hover:bg-pharmacy-green p-2 rounded">Inventory</Link>
      </nav>
      <Link href="/auth/logout" className="flex items-center gap-2 hover:bg-error-red p-2 rounded">
        <LogOut size={20} />
        Logout
      </Link>
    </div>
  );
}