export function generateWhatsAppLink(cart, total) {
  const message = encodeURIComponent(
    `I'd like to order:\n${cart
      .map(item => `${item.name} (x${item.quantity}) - $${(item.price * item.quantity).toFixed(2)}`)
      .join('\n')}\nTotal: $${total.toFixed(2)}`
  );
  return `https://wa.me/+256751360385?text=${message}`;
}