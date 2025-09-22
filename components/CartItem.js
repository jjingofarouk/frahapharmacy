'use client';
import Image from 'next/image';
import Button from '@components/ui/Button';
import { useCartStore } from '@stores/cartStore';

export default function CartItem({ item }) {
  const { updateQuantity, removeFromCart } = useCartStore();

  return (
    <div className="flex items-center bg-white p-4 rounded-lg shadow-md">
      <Image
        src={item.imageUrl || '/images/placeholder.jpg'}
        alt={item.name}
        width={100}
        height={100}
        className="rounded"
      />
      <div className="flex-1 ml-4">
        <h3 className="text-lg font-semibold text-dark-blue">{item.name}</h3>
        <p className="text-neutral-dark">${item.price.toFixed(2)} x {item.quantity}</p>
        <div className="flex items-center space-x-2 mt-2">
          <Button
            className="bg-pharmacy-green text-white"
            onClick={() => updateQuantity(item.id, item.quantity - 1)}
          >
            -
          </Button>
          <span>{item.quantity}</span>
          <Button
            className="bg-pharmacy-green text-white"
            onClick={() => updateQuantity(item.id, item.quantity + 1)}
          >
            +
          </Button>
          <Button
            className="bg-error-red text-white"
            onClick={() => removeFromCart(item.id)}
          >
            Remove
          </Button>
        </div>
      </div>
    </div>
  );
}