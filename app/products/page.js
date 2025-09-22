// app/products/page.jsx
'use client';

import { useState, useEffect } from 'react';
import { useQuery } from '@tanstack/react-query';
import { useSearchParams, useRouter } from 'next/navigation';
import { motion, AnimatePresence } from 'framer-motion';
import { useForm } from 'react-hook-form';
import { Search, Filter, Grid, List } from 'lucide-react';
import Skeleton from 'react-loading-skeleton';
import ReactPaginate from 'react-paginate';
import ProductCard from '@components/ProductCard';
import { clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

async function getProducts({ page = 1, search = '', category = '' }) {
  const params = new URLSearchParams({ page: page.toString(), search, category });
  const res = await fetch(`http://localhost:3000/api/products?${params}`, { cache: 'no-store' });
  if (!res.ok) throw new Error('Failed to fetch products');
  return res.json(); // { products, totalCount }
}

export default function ProductsPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const page = parseInt(searchParams.get('page') || '1');
  const search = searchParams.get('search') || '';
  const category = searchParams.get('category') || '';
  const [view, setView] = useState('grid');

  const { data, isLoading } = useQuery({
    queryKey: ['products', page, search, category],
    queryFn: () => getProducts({ page, search, category }),
    keepPreviousData: true,
  });

  const products = data?.products || [];
  const totalPages = Math.ceil((data?.totalCount || 0) / 20);

  const { register, handleSubmit, watch } = useForm({
    defaultValues: { search },
  });

  useEffect(() => {
    const subscription = watch(({ search: newSearch }) => {
      const params = new URLSearchParams(searchParams);
      if (newSearch) params.set('search', newSearch);
      else params.delete('search');
      params.set('page', '1');
      router.push(`/products?${params.toString()}`);
    });
    return () => subscription.unsubscribe();
  }, [watch, router, searchParams]);

  const handleCategoryChange = (newCategory) => {
    const params = new URLSearchParams(searchParams);
    if (newCategory !== 'all') params.set('category', newCategory);
    else params.delete('category');
    params.set('page', '1');
    router.push(`/products?${params.toString()}`);
  };

  const handlePageChange = ({ selected }) => {
    const params = new URLSearchParams(searchParams);
    params.set('page', (selected + 1).toString());
    router.push(`/products?${params.toString()}`);
  };

  return (
    <div className="min-h-screen bg-neutral-gray">
      <div className="container mx-auto px-4 py-8">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="mb-8"
        >
          <h1 className="text-4xl font-bold text-text-dark mb-4">Our Products</h1>
          <p className="text-xl text-text-muted max-w-2xl">
            Browse our comprehensive selection of quality medications and healthcare products.
          </p>
        </motion.div>

        {/* Search and Filter Bar */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.5, delay: 0.2 }}
          className="bg-white border border-border-light rounded-xl shadow-soft p-6 mb-8"
        >
          <form onSubmit={handleSubmit()} className="flex flex-col lg:flex-row gap-4 items-center">
            <div className="flex-1 relative">
              <Search
                size={20}
                className="absolute left-3 top-1/2 transform -translate-y-1/2 text-text-muted"
                aria-hidden="true"
              />
              <input
                {...register('search')}
                type="text"
                placeholder="Search for medications, vitamins, or health products..."
                className="w-full pl-12 pr-4 py-3 border border-border-light rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-blue"
                aria-label="Search products"
              />
            </div>
            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              className="flex items-center gap-2 bg-accent-blue hover:bg-blue-400 text-primary-blue hover:text-white font-medium py-3 px-6 rounded-lg transition-colors duration-200"
            >
              <Filter size={20} /> Filter
            </motion.button>
            <div className="flex border border-border-light rounded-lg overflow-hidden">
              <motion.button
                whileHover={{ backgroundColor: '#e5e7eb' }}
                onClick={() => setView('grid')}
                className={twMerge(
                  clsx('p-3', view === 'grid' ? 'bg-primary-blue text-white' : 'text-text-muted')
                )}
                aria-label="Grid view"
              >
                <Grid size={20} />
              </motion.button>
              <motion.button
                whileHover={{ backgroundColor: '#e5e7eb' }}
                onClick={() => setView('list')}
                className={twMerge(
                  clsx('p-3', view === 'list' ? 'bg-primary-blue text-white' : 'text-text-muted')
                )}
                aria-label="List view"
              >
                <List size={20} />
              </motion.button>
            </div>
          </form>
        </motion.div>

        {/* Category Pills */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.5, delay: 0.4 }}
          className="flex flex-wrap gap-3 mb-8"
        >
          {[
            { label: 'All Products', value: 'all' },
            { label: 'Prescription Drugs', value: 'prescription' },
            { label: 'Over-the-Counter', value: 'otc' },
            { label: 'Vitamins & Supplements', value: 'vitamins' },
            { label: 'Personal Care', value: 'personal' },
            { label: 'Baby & Mother Care', value: 'baby' },
          ].map(({ label, value }) => (
            <motion.button
              key={value}
              whileHover={{ y: -2 }}
              whileTap={{ scale: 0.95 }}
              onClick={() => handleCategoryChange(value)}
              className={twMerge(
                clsx(
                  'px-6 py-2 rounded-full font-medium transition-colors duration-200',
                  category === value || (value === 'all' && !category)
                    ? 'bg-primary-blue text-white'
                    : 'bg-white hover:bg-neutral-gray text-text-dark border border-border-light'
                )
              )}
            >
              {label}
            </motion.button>
          ))}
        </motion.div>

        {/* Products Count */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.5, delay: 0.6 }}
          className="flex justify-between items-center mb-6"
        >
          <p className="text-text-muted">
            Showing <span className="font-semibold text-text-dark">{products.length}</span> products
          </p>
          <select
            className="border border-border-light rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-blue"
            aria-label="Sort products"
          >
            <option>Sort by: Featured</option>
            <option>Price: Low to High</option>
            <option>Price: High to Low</option>
            <option>Name: A to Z</option>
            <option>Name: Z to A</option>
          </select>
        </motion.div>

        {/* Products Grid */}
        <AnimatePresence mode="wait">
          {isLoading ? (
            <motion.div
              key="loading"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className={twMerge(
                clsx(
                  view === 'grid'
                    ? 'grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8'
                    : 'flex flex-col gap-4'
                )
              )}
            >
              {Array(12)
                .fill()
                .map((_, i) => (
                  <Skeleton key={i} height={view === 'grid' ? 300 : 100} className="rounded-xl" />
                ))}
            </motion.div>
          ) : products.length > 0 ? (
            <motion.div
              key="products"
              layout
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className={twMerge(
                clsx(
                  view === 'grid'
                    ? 'grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8'
                    : 'flex flex-col gap-4'
                )
              )}
            >
              {products.map((product, index) => (
                <motion.div
                  key={product.id}
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: index * 0.05 }}
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
              <div className="w-24 h-24 bg-light-green rounded-full flex items-center justify-center mx-auto mb-6">
                <Search size={48} className="text-success-green" aria-hidden="true" />
              </div>
              <h3 className="text-2xl font-bold text-text-dark mb-4">No Products Found</h3>
              <p className="text-text-muted mb-8">
                We couldn't find any products matching your criteria. Try adjusting your search or filters.
              </p>
              <motion.button
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
                onClick={() => router.push('/products')}
                className="btn-primary"
              >
                Clear Filters
              </motion.button>
            </motion.div>
          )}
        </AnimatePresence>

        {/* Pagination */}
        {totalPages > 1 && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 0.5, delay: 0.8 }}
            className="flex justify-center items-center gap-2 mt-8"
          >
            <ReactPaginate
              previousLabel="Previous"
              nextLabel="Next"
              pageCount={totalPages}
              onPageChange={handlePageChange}
              containerClassName="flex gap-2"
              pageClassName="px-4 py-2 border border-border-light rounded-lg hover:bg-neutral-gray text-text-muted"
              activeClassName="bg-primary-blue text-white"
              previousClassName="px-4 py-2 border border-border-light rounded-lg hover:bg-neutral-gray text-text-muted"
              nextClassName="px-4 py-2 border border-border-light rounded-lg hover:bg-neutral-gray text-text-muted"
              disabledClassName="opacity-50 cursor-not-allowed"
            />
          </motion.div>
        )}

        {/* Trust Indicators */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.5, delay: 1 }}
          className="mt-16 bg-white border border-border-light rounded-xl shadow-soft p-8"
        >
          <div className="text-center mb-8">
            <h2 className="text-3xl font-bold text-text-dark mb-4">Your Health, Our Priority</h2>
            <p className="text-xl text-text-muted max-w-2xl mx-auto">
              All our products meet the highest quality standards and safety requirements.
            </p>
          </div>
          <div className="grid md:grid-cols-3 gap-8">
            {[
              { icon: '🏥', title: 'Licensed Pharmacy', desc: 'Fully licensed and regulated by Uganda National Drug Authority (NDA)' },
              { icon: '✅', title: 'Quality Guaranteed', desc: 'All medications sourced from verified manufacturers with proper certifications' },
              { icon: '🔒', title: 'Secure & Safe', desc: 'Proper storage conditions and tamper-proof packaging for your safety' },
            ].map(({ icon, title, desc }, index) => (
              <motion.div
                key={title}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 1.2 + index * 0.2 }}
                className="text-center"
              >
                <div className="w-16 h-16 bg-light-green rounded-full flex items-center justify-center mx-auto mb-4">
                  <span className="text-3xl">{icon}</span>
                </div>
                <h3 className="text-xl font-semibold text-text-dark mb-2">{title}</h3>
                <p className="text-text-muted">{desc}</p>
              </motion.div>
            ))}
          </div>
        </motion.div>
      </div>
    </div>
  );
}