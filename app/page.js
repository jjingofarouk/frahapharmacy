'use client';

import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import Link from 'next/link';
import { Shield, Heart, Clock, CheckCircle } from 'lucide-react';
import ProductCard from '@components/ProductCard';
import Skeleton from 'react-loading-skeleton';
import 'react-loading-skeleton/dist/skeleton.css';

export default function Home() {
  const [products, setProducts] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        setIsLoading(true);
        const res = await fetch('/api/products?limit=6');
        
        if (!res.ok) {
          throw new Error(`HTTP error! status: ${res.status}`);
        }
        
        const data = await res.json();
        console.log('API Response:', data); // Debug log
        
        // Handle both array format and object format
        if (Array.isArray(data)) {
          setProducts(data.slice(0, 6)); // Take first 6 if it's an array
        } else if (data.products && Array.isArray(data.products)) {
          setProducts(data.products.slice(0, 6));
        } else {
          console.error('Unexpected data format:', data);
          setProducts([]);
        }
      } catch (err) {
        console.error('Error fetching products:', err);
        setError(err.message);
        setProducts([]);
      } finally {
        setIsLoading(false);
      }
    };

    fetchProducts();
  }, []);

  return (
    <div className="min-h-screen">
      {/* Hero Section */}
      <motion.section
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.8 }}
        className="bg-gradient-to-r from-primary-blue to-blue-600 text-white"
      >
        <div className="container mx-auto px-4 py-16 md:py-24">
          <div className="grid md:grid-cols-2 gap-12 items-center">
            <motion.div
              initial={{ opacity: 0, x: -50 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.6, delay: 0.2 }}
            >
              <h1 className="text-5xl md:text-6xl font-bold mb-6 leading-tight">
                Welcome to <span className="text-accent-blue">Fraha Pharmacy</span>
              </h1>
              <p className="text-xl md:text-2xl mb-8 text-blue-100 leading-relaxed">
                Your trusted healthcare partner delivering quality medications and expert care with a personal touch.
              </p>
              <div className="flex flex-col sm:flex-row gap-4">
                <motion.div whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}>
                  <Link href="/products" className="btn-primary inline-block text-center px-8 py-4 text-lg">
                    Browse Products
                  </Link>
                </motion.div>
                <motion.div whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}>
                  <Link
                    href="/contact"
                    className="bg-transparent border-2 border-white text-white hover:bg-white hover:text-primary-blue font-medium py-4 px-8 text-lg rounded-lg transition-colors duration-200"
                  >
                    Contact Us
                  </Link>
                </motion.div>
              </div>
            </motion.div>
            <motion.div
              initial={{ opacity: 0, scale: 0.8 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ duration: 0.6, delay: 0.4 }}
              className="relative"
            >
              <div className="bg-accent-blue/20 rounded-2xl p-8 backdrop-blur-sm shadow-lg">
                <div className="text-center space-y-4">
                  <Shield size={64} className="mx-auto text-accent-blue" />
                  <h3 className="text-2xl font-semibold">Licensed & Trusted</h3>
                  <p className="text-blue-100">Fully licensed pharmacy with certified pharmacists</p>
                </div>
              </div>
            </motion.div>
          </div>
        </div>
      </motion.section>

      {/* Features Section */}
      <motion.section
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.8, delay: 0.2 }}
        className="bg-neutral-gray"
      >
        <div className="container mx-auto px-4 py-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl font-bold text-text-dark mb-4">Why Choose Fraha Pharmacy?</h2>
            <p className="text-xl text-text-muted max-w-2xl mx-auto">
              Exceptional pharmaceutical care with a commitment to quality and service.
            </p>
          </motion.div>
          <div className="grid md:grid-cols-3 gap-8">
            {[
              {
                icon: <Heart size={32} className="text-success-green" />,
                title: 'Professional Care',
                desc: 'Expert consultation and personalized healthcare advice from qualified pharmacists.',
              },
              {
                icon: <Clock size={32} className="text-primary-blue" />,
                title: 'Quick Service',
                desc: 'Fast prescription filling and efficient service to meet your needs.',
              },
              {
                icon: <CheckCircle size={32} className="text-success-green" />,
                title: 'Quality Assured',
                desc: 'Medications sourced from verified suppliers with strict quality controls.',
              },
            ].map((feature, index) => (
              <motion.div
                key={feature.title}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.5, delay: 0.2 + index * 0.2 }}
                whileHover={{ scale: 1.03, boxShadow: '0 10px 20px rgba(0,0,0,0.1)' }}
                className="text-center p-8 bg-white rounded-xl shadow-soft"
              >
                <div className="w-16 h-16 bg-light-green rounded-full flex items-center justify-center mx-auto mb-6">
                  {feature.icon}
                </div>
                <h3 className="text-2xl font-semibold text-text-dark mb-4">{feature.title}</h3>
                <p className="text-text-muted leading-relaxed">{feature.desc}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </motion.section>

      {/* Featured Products */}
      <motion.section
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.8, delay: 0.4 }}
        className="bg-white"
      >
        <div className="container mx-auto px-4 py-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl font-bold text-text-dark mb-4">Featured Products</h2>
            <p className="text-xl text-text-muted max-w-2xl mx-auto">
              Discover our most popular healthcare products and medications.
            </p>
          </motion.div>

          {/* Debug Info */}
          {error && (
            <div className="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-8">
              <strong>Error:</strong> {error}
            </div>
          )}

          <AnimatePresence mode="wait">
            {isLoading ? (
              <motion.div
                key="loading"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12"
              >
                {Array(6)
                  .fill()
                  .map((_, i) => (
                    <Skeleton key={i} height={300} className="rounded-xl" />
                  ))}
              </motion.div>
            ) : products.length > 0 ? (
              <motion.div
                key="products"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12"
              >
                {products.map((product, index) => (
                  <motion.div
                    key={product.id}
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: index * 0.1 }}
                    whileHover={{ scale: 1.02 }}
                  >
                    <ProductCard product={product} />
                  </motion.div>
                ))}
              </motion.div>
            ) : (
              <motion.div
                key="empty"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                className="text-center py-16"
              >
                <div className="text-xl text-text-muted mb-4">
                  No products found. Check console for debug information.
                </div>
                <p className="text-sm text-gray-500">
                  Products count: {products.length} | Loading: {isLoading.toString()} | Error: {error || 'None'}
                </p>
              </motion.div>
            )}
          </AnimatePresence>

          <motion.div
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            className="text-center"
          >
            <Link href="/products" className="btn-primary inline-block px-8 py-4 text-lg">
              View All Products
            </Link>
          </motion.div>
        </div>
      </motion.section>

      {/* Stats Section */}
      <motion.section
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.8, delay: 0.6 }}
        className="bg-gradient-to-r from-primary-blue to-blue-600 text-white"
      >
        <div className="container mx-auto px-4 py-16">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            {[
              { value: '10+', label: 'Years of Experience' },
              { value: '5000+', label: 'Happy Customers' },
              { value: '1000+', label: 'Products Available' },
              { value: '24/7', label: 'Customer Support' },
            ].map((stat, index) => (
              <motion.div
                key={stat.label}
                initial={{ opacity: 0, scale: 0.8 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ delay: 0.8 + index * 0.2 }}
              >
                <div className="text-4xl font-bold text-accent-blue mb-2">{stat.value}</div>
                <div className="text-blue-100">{stat.label}</div>
              </motion.div>
            ))}
          </div>
        </div>
      </motion.section>

      {/* CTA Section */}
      <motion.section
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.8, delay: 0.8 }}
        className="bg-light-green"
      >
        <div className="container mx-auto px-4 py-16 text-center">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="text-4xl font-bold text-text-dark mb-6"
          >
            Ready to Experience Better Healthcare?
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.2 }}
            className="text-xl text-text-muted mb-8 max-w-2xl mx-auto"
          >
            Visit Fraha Pharmacy today and discover why thousands trust us with their healthcare needs.
          </motion.p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <motion.div whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}>
              <Link href="/products" className="btn-secondary inline-block px-8 py-4 text-lg">
                Shop Now
              </Link>
            </motion.div>
            <motion.div whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}>
              <Link
                href="/about"
                className="bg-white text-text-dark hover:bg-gray-50 font-medium py-4 px-8 text-lg rounded-lg transition-colors duration-200 border border-border-light"
              >
                Learn More
              </Link>
            </motion.div>
          </div>
        </div>
      </motion.section>
    </div>
  );
}