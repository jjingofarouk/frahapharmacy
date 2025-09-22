// stores/cartStore.js
import { create } from 'zustand';
import { calculateCartTotal } from '@lib/cart';

export const useCartStore = create((set, get) => ({
  cart: [],
  addToCart: (item) => set((state) => {
    const existing = state.cart.find(i => i.id === item.id);
    if (existing) {
      return {
        cart: state.cart.map(i =>
          i.id === item.id ? { ...i, quantity: i.quantity + 1 } : i
        ),
      };
    }
    return { cart: [...state.cart, { ...item, quantity: 1 }] };
  }),
  updateQuantity: (id, quantity) => set((state) => {
    if (quantity <= 0) {
      return { cart: state.cart.filter(item => item.id !== id) };
    }
    return {
      cart: state.cart.map(item =>
        item.id === item.id ? { ...item, quantity } : item
      ),
    };
  }),
  removeFromCart: (id) => set((state) => ({
    cart: state.cart.filter(item => item.id !== id),
  })),
  clearCart: () => set({ cart: [] }),
  getTotal: () => calculateCartTotal(get().cart),
}));