'use client';
import Link from 'next/link';
import Card from '@components/ui/Card';

export default function OrderCard({ order }) {
  return (
    <Card>
      <h3 className="text-lg font-semibold text-dark-blue">Order #{order.id}</h3>
      <p className="text-neutral-dark">Total: ${order.total.toFixed(2)}</p>
      <p className="text-neutral-dark">Status: {order.status}</p>
      <p className="text-neutral-dark">Items: {order.items.length}</p>
      <Link href={`/admin/orders/${order.id}`}>
        <button className="mt-2 text-pharmacy-green">View Details</button>
      </Link>
    </Card>
  );
}