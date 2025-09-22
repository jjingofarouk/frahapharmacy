'use client';
import Link from 'next/link';
import { ShoppingCart, Menu, X } from 'lucide-react';
import { useCartStore } from '@stores/cartStore';
import { useState } from 'react';

export default function Navbar() {
  const { cart } = useCartStore();
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <nav className="bg-white border-b border-border-light sticky top-0 z-50 shadow-soft">
      <div className="container-max">
        <div className="flex justify-between items-center py-4 px-6">
          {/* Logo */}
          <Link href="/" className="flex items-center space-x-3">
            <div className="w-10 h-10 bg-primary-blue rounded-lg flex items-center justify-center">
              <span className="text-white font-bold text-xl">F</span>
            </div>
            <div>
              <div className="text-2xl font-bold text-text-dark">Fraha Pharmacy</div>
              <div className="text-sm text-text-muted">Your Health Partner</div>
            </div>
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center space-x-8">
            <Link 
              href="/products" 
              className="text-text-dark hover:text-primary-blue font-medium transition-colors duration-200"
            >
              Products
            </Link>
            <Link 
              href="/about" 
              className="text-text-dark hover:text-primary-blue font-medium transition-colors duration-200"
            >
              About
            </Link>
            <Link 
              href="/contact" 
              className="text-text-dark hover:text-primary-blue font-medium transition-colors duration-200"
            >
              Contact
            </Link>
            
            {/* Cart */}
            <Link 
              href="/cart" 
              className="flex items-center space-x-2 bg-primary-blue hover:bg-hover-blue text-white px-4 py-2 rounded-lg transition-colors duration-200"
            >
              <ShoppingCart size={20} />
              <span className="font-medium">{cart.length}</span>
            </Link>
          </div>

          {/* Mobile Menu Button */}
          <button
            className="md:hidden p-2"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            {isMenuOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <div className="md:hidden border-t border-border-light">
            <div className="py-4 px-6 space-y-4">
              <Link 
                href="/products" 
                className="block text-text-dark hover:text-primary-blue font-medium transition-colors duration-200"
                onClick={() => setIsMenuOpen(false)}
              >
                Products
              </Link>
              <Link 
                href="/about" 
                className="block text-text-dark hover:text-primary-blue font-medium transition-colors duration-200"
                onClick={() => setIsMenuOpen(false)}
              >
                About
              </Link>
              <Link 
                href="/contact" 
                className="block text-text-dark hover:text-primary-blue font-medium transition-colors duration-200"
                onClick={() => setIsMenuOpen(false)}
              >
                Contact
              </Link>
              <Link 
                href="/cart" 
                className="flex items-center space-x-2 bg-primary-blue text-white px-4 py-2 rounded-lg w-fit"
                onClick={() => setIsMenuOpen(false)}
              >
                <ShoppingCart size={20} />
                <span className="font-medium">Cart ({cart.length})</span>
              </Link>
            </div>
          </div>
        )}
      </div>
    </nav>
  );
}