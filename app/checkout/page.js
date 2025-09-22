import { useCartStore } from '@stores/cartStore';
import { redirect } from 'next/navigation';
import { generateWhatsAppLink } from '@lib/whatsapp';

export default function Checkout() {
  const { cart, getTotal, clearCart } = useCartStore();
  if (cart.length === 0) {
    redirect('/products');
  }

  const total = getTotal();
  const whatsappLink = generateWhatsAppLink(cart, total);

  // Store order in database
  fetch('/api/orders', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      items: cart.map(item => ({
        productId: item.id,
        quantity: item.quantity,
        price: item.price,
      })),
      total,
    }),
  }).then(() => clearCart());

  redirect(whatsappLink);
}