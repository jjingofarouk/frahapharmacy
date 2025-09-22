'use client'
import { useCartStore } from '@stores/cartStore';
import CartItem from '@components/CartItem';
import Button from '@components/ui/Button';
import Link from 'next/link';
import { generateWhatsAppLink } from '@lib/whatsapp';
import { ShoppingBag, ArrowLeft, MessageCircle } from 'lucide-react';

export default function Cart() {
  const { cart, getTotal } = useCartStore();
  const total = getTotal();
  const whatsappLink = generateWhatsAppLink(cart, total);

  if (cart.length === 0) {
    return (
      <div className="min-h-screen bg-neutral-gray">
        <div className="container-max section-padding">
          <div className="text-center max-w-md mx-auto">
            <div className="w-24 h-24 bg-light-green rounded-full flex items-center justify-center mx-auto mb-8">
              <ShoppingBag size={48} className="text-success-green" />
            </div>
            <h1 className="text-3xl font-bold text-text-dark mb-4">Your Cart is Empty</h1>
            <p className="text-text-muted mb-8 leading-relaxed">
              Looks like you haven't added any items to your cart yet. Browse our products to find what you need.
            </p>
            <Link href="/products" className="btn-primary inline-flex items-center gap-2">
              <ArrowLeft size={20} />
              Continue Shopping
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-neutral-gray">
      <div className="container-max section-padding">
        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center gap-4 mb-4">
            <Link 
              href="/products" 
              className="flex items-center gap-2 text-text-muted hover:text-primary-blue transition-colors duration-200"
            >
              <ArrowLeft size={20} />
              Continue Shopping
            </Link>
          </div>
          <h1 className="text-4xl font-bold text-text-dark">Shopping Cart</h1>
          <p className="text-text-muted mt-2">
            {cart.length} item{cart.length !== 1 ? 's' : ''} in your cart
          </p>
        </div>

        <div className="grid lg:grid-cols-3 gap-8">
          {/* Cart Items */}
          <div className="lg:col-span-2 space-y-6">
            {cart.map(item => (
              <CartItem key={item.id} item={item} />
            ))}
          </div>

          {/* Order Summary */}
          <div className="lg:col-span-1">
            <div className="bg-white border border-border-light rounded-xl shadow-soft p-6 sticky top-24">
              <h2 className="text-2xl font-bold text-text-dark mb-6">Order Summary</h2>
              
              {/* Cart Items Summary */}
              <div className="space-y-4 mb-6">
                {cart.map(item => (
                  <div key={item.id} className="flex justify-between items-center py-2 border-b border-border-light last:border-b-0">
                    <div className="flex-1 min-w-0">
                      <div className="font-medium text-text-dark truncate">{item.name}</div>
                      <div className="text-sm text-text-muted">Qty: {item.quantity}</div>
                    </div>
                    <div className="font-semibold text-text-dark">
                      UGX {(item.price * item.quantity).toLocaleString()}
                    </div>
                  </div>
                ))}
              </div>

              {/* Total */}
              <div className="border-t border-border-light pt-6 mb-6">
                <div className="flex justify-between items-center mb-2">
                  <span className="text-text-muted">Subtotal:</span>
                  <span className="font-semibold">UGX {total.toLocaleString()}</span>
                </div>
                <div className="flex justify-between items-center mb-2">
                  <span className="text-text-muted">Delivery:</span>
                  <span className="font-semibold text-success-green">Free</span>
                </div>
                <div className="flex justify-between items-center text-xl font-bold text-text-dark pt-2 border-t border-border-light">
                  <span>Total:</span>
                  <span>UGX {total.toLocaleString()}</span>
                </div>
              </div>

              {/* Checkout Button */}
              <Link 
                href={whatsappLink} 
                className="w-full bg-success-green hover:bg-green-600 text-white font-semibold py-4 px-6 rounded-lg transition-colors duration-200 flex items-center justify-center gap-3 mb-4"
              >
                <MessageCircle size={20} />
                Checkout via WhatsApp
              </Link>

              <p className="text-sm text-text-muted text-center leading-relaxed">
                You'll be redirected to WhatsApp to complete your order with our team.
              </p>
            </div>
          </div>
        </div>

        {/* Additional Info */}
        <div className="mt-12 bg-white border border-border-light rounded-xl shadow-soft p-6">
          <h3 className="text-xl font-semibold text-text-dark mb-4">Why Choose Fraha Pharmacy?</h3>
          <div className="grid md:grid-cols-3 gap-6 text-center">
            <div>
              <div className="w-12 h-12 bg-light-green rounded-full flex items-center justify-center mx-auto mb-3">
                <span className="text-2xl">🚚</span>
              </div>
              <h4 className="font-semibold text-text-dark mb-2">Free Delivery</h4>
              <p className="text-sm text-text-muted">Free delivery on all orders within Kampala</p>
            </div>
            <div>
              <div className="w-12 h-12 bg-light-green rounded-full flex items-center justify-center mx-auto mb-3">
                <span className="text-2xl">💊</span>
              </div>
              <h4 className="font-semibold text-text-dark mb-2">Quality Assured</h4>
              <p className="text-sm text-text-muted">All medications verified and properly stored</p>
            </div>
            <div>
              <div className="w-12 h-12 bg-light-green rounded-full flex items-center justify-center mx-auto mb-3">
                <span className="text-2xl">👨‍⚕️</span>
              </div>
              <h4 className="font-semibold text-text-dark mb-2">Expert Care</h4>
              <p className="text-sm text-text-muted">Professional consultation available</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}