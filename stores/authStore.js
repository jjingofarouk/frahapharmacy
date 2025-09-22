// stores/authStore.js
import { create } from 'zustand';
import { supabase } from '@lib/supabase';

export const useAuthStore = create((set) => ({
  user: null,
  fetchUser: async () => {
    const { data: { session } } = await supabase.auth.getSession();
    set({ user: session?.user || null });
  },
  setUser: (user) => set({ user }),
}));