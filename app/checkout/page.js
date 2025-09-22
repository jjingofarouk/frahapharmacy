"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";
import { useCartStore } from "@stores/cartStore";
import { generateWhatsAppLink } from "@lib/whatsapp";

export default function Checkout() {
  const router = useRouter();
  const { cart, getTotal, clearCart } = useCartStore();

  useEffect(() => {
    if (cart.length === 0) {
      router.replace("/products");
      return;
    }

    const total = getTotal();
    const whatsappLink = generateWhatsAppLink(cart, total);

    // Store order in database then clear cart
    fetch("/api/orders", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        items: cart.map((item) => ({
          productId: item.id,
          quantity: item.quantity,
          price: item.price,
        })),
        total,
      }),
    }).then(() => {
      clearCart();
      router.replace(whatsappLink);
    });
  }, [cart, getTotal, clearCart, router]);

  return <p>Processing your checkout...</p>;
}
