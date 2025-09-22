'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  ChevronLeft, 
  ChevronRight, 
  Star, 
  Clock, 
  Shield, 
  Truck, 
  Phone,
  MapPin,
  ArrowRight,
  Heart,
  ShoppingCart
} from 'lucide-react';
import { useCartStore } from '@/stores/cartStore';

const CURRENCIES = [
  { code: 'UGX', symbol: 'UGX', rate: 1 },
  { code: 'USD', symbol: '$', rate: 0.00027 },
  { code: 'EUR', symbol: '€', rate: 0.00025 },
  { code: 'GBP', symbol: '£', rate: 0.00021 },
  { code: 'KES', symbol: 'KSh', rate: 0.035 },
  { code: 'TZS', symbol: 'TSh', rate: 0.63 },
  { code: 'RWF', symbol: 'RWF', rate: 0.31 },
  { code: 'ZAR', symbol: 'R', rate: 0.005 },
  { code: 'NGN', symbol: '₦', rate: 0.42 },
  { code: 'GHS', symbol: '₵', rate: 0.0032 }
];

const FEATURED_BRANDS = [
  'Pfizer', 'GSK', 'Novartis', 'Roche', 'Johnson & Johnson', 
  'Merck', 'AstraZeneca', 'Sanofi', 'Abbott', 'Bayer'
];

export default function PharmacyHomepage() {
  const { addToCart } = useCartStore();
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [dealProducts, setDealProducts] = useState([]);
  const [currentDeal, setCurrentDeal] = useState(0);
  const [selectedCurrency, setSelectedCurrency] = useState('UGX');
  const [isLoading, setIsLoading] = useState(true);
  const [showCategories, setShowCategories] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setIsLoading(true);
        
        // Fetch products and categories
        const [productsRes, categoriesRes] = await Promise.all([
          fetch('/api/products'),
          fetch('/api/categories')
        ]);

        // Check if responses are ok
        if (!productsRes.ok) throw new Error('Failed to fetch products');
        if (!categoriesRes.ok) throw new Error('Failed to fetch categories');

        const productsData = await productsRes.json();
        const categoriesData = await categoriesRes.json();

        // Handle API errors
        if (productsData.error) {
          console.error('Products API error:', productsData.error);
          setProducts([]);
        } else if (Array.isArray(productsData)) {
          setProducts(productsData);
          // Create deal products with fake discounts
          const randomProducts = productsData
            .sort(() => Math.random() - 0.5)
            .slice(0, 5)
            .map(product => ({
              ...product,
              originalPrice: product.price * (1 + Math.random() * 0.5 + 0.2),
              discount: Math.floor(Math.random() * 30) + 20
            }));
          setDealProducts(randomProducts);
        }
        
        if (categoriesData.error) {
          console.error('Categories API error:', categoriesData.error);
          setCategories([]);
        } else if (Array.isArray(categoriesData)) {
          setCategories(categoriesData);
        }
      } catch (error) {
        console.error('Error fetching data:', error);
        // Set empty arrays as fallback
        setProducts([]);
        setCategories([]);
        setDealProducts([]);
      } finally {
        setIsLoading(false);
      }
    };

    fetchData();
  }, []);

  // Auto-advance deal slider
  useEffect(() => {
    if (dealProducts.length > 0) {
      const interval = setInterval(() => {
        setCurrentDeal((prev) => (prev + 1) % dealProducts.length);
      }, 4000);
      return () => clearInterval(interval);
    }
  }, [dealProducts.length]);

  const formatPrice = (price) => {
    const currency = CURRENCIES.find(c => c.code === selectedCurrency);
    const convertedPrice = price * currency.rate;
    
    if (selectedCurrency === 'UGX') {
      return `${currency.symbol} ${Math.round(convertedPrice).toLocaleString()}`;
    }
    return `${currency.symbol}${convertedPrice.toFixed(2)}`;
  };

  const nextDeal = () => {
    setCurrentDeal((prev) => (prev + 1) % dealProducts.length);
  };

  const prevDeal = () => {
    setCurrentDeal((prev) => (prev - 1 + dealProducts.length) % dealProducts.length);
  };

  const handleAddToCart = (product) => {
    addToCart(product);
  };

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-green-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-xl text-gray-600">Loading your pharmacy...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-white">
      {/* Hero Section */}
      <section className="relative bg-gradient-to-br from-blue-600 via-blue-700 to-green-600 text-white overflow-hidden">
        <div className="absolute inset-0">
          {[...Array(20)].map((_, i) => (
            <motion.div
              key={i}
              className="absolute rounded-full bg-white/10"
              style={{
                width: Math.random() * 100 + 50,
                height: Math.random() * 100 + 50,
                left: `${Math.random() * 100}%`,
                top: `${Math.random() * 100}%`,
              }}
              animate={{
                y: [0, -30, 0],
                opacity: [0.3, 0.8, 0.3],
              }}
              transition={{
                duration: Math.random() * 3 + 2,
                repeat: Infinity,
                delay: Math.random() * 2,
              }}
            />
          ))}
        </div>
        
        <div className="relative container mx-auto px-4 py-20">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <motion.div
              initial={{ opacity: 0, x: -50 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.8 }}
            >
              <h1 className="text-5xl lg:text-7xl font-bold mb-6 leading-tight">
                Your Health,
                <span className="text-blue-300 block">Our Priority</span>
              </h1>
              <p className="text-xl mb-8 text-blue-100 leading-relaxed max-w-lg">
                Experience premium pharmaceutical care with Fraha Pharmacy - your trusted health partner in Kampala.
              </p>
              
              <div className="flex flex-col sm:flex-row gap-4">
                <motion.div
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                >
                  <Link
                    href="/products"
                    className="bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded-xl font-semibold flex items-center justify-center gap-2 transition-colors"
                  >
                    <ShoppingCart size={20} />
                    Shop Now
                  </Link>
                </motion.div>
                
                <motion.button
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                  className="border-2 border-white text-white hover:bg-white hover:text-blue-600 px-8 py-4 rounded-xl font-semibold transition-colors"
                  onClick={() => setShowCategories(!showCategories)}
                >
                  Browse Categories
                </motion.button>
              </div>
              
              <div className="mt-8">
                <label className="text-blue-100 text-sm mb-2 block">Currency:</label>
                <select
                  value={selectedCurrency}
                  onChange={(e) => setSelectedCurrency(e.target.value)}
                  className="bg-white/20 border border-white/30 rounded-lg px-4 py-2 text-white backdrop-blur-sm"
                >
                  {CURRENCIES.map(currency => (
                    <option key={currency.code} value={currency.code} className="text-black">
                      {currency.code} ({currency.symbol})
                    </option>
                  ))}
                </select>
              </div>
            </motion.div>
            
            <motion.div
              initial={{ opacity: 0, scale: 0.8 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ duration: 0.8, delay: 0.2 }}
              className="relative"
            >
              <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 border border-white/20">
                <div className="text-center space-y-6">
                  <div className="w-24 h-24 bg-blue-300 rounded-full flex items-center justify-center mx-auto">
                    <Shield size={40} className="text-white" />
                  </div>
                  <h3 className="text-2xl font-bold">Licensed & Trusted</h3>
                  <p className="text-blue-100">Certified pharmacy with qualified professionals</p>
                  
                  <div className="grid grid-cols-3 gap-4 pt-4">
                    <div className="text-center">
                      <div className="text-2xl font-bold text-blue-300">10+</div>
                      <div className="text-sm text-blue-100">Years</div>
                    </div>
                    <div className="text-center">
                      <div className="text-2xl font-bold text-blue-300">5000+</div>
                      <div className="text-sm text-blue-100">Customers</div>
                    </div>
                    <div className="text-center">
                      <div className="text-2xl font-bold text-blue-300">24/7</div>
                      <div className="text-sm text-blue-100">Support</div>
                    </div>
                  </div>
                </div>
              </div>
            </motion.div>
          </div>
        </div>
      </section>

      {/* Categories Quick Menu */}
      <AnimatePresence>
        {showCategories && (
          <motion.section
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: 'auto', opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            className="bg-gradient-to-r from-green-50 to-blue-50 border-b border-gray-200"
          >
            <div className="container mx-auto px-4 py-8">
              <h3 className="text-2xl font-bold text-center mb-6 text-gray-800">Shop by Category</h3>
              <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                {categories.slice(0, 12).map((category, index) => (
                  <motion.div
                    key={category.id}
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: index * 0.1 }}
                  >
                    <Link
                      href={`/products?category=${category.id}`}
                      className="bg-white rounded-xl p-4 text-center hover:shadow-lg transition-shadow cursor-pointer border border-gray-200 block"
                    >
                      <div className="w-12 h-12 bg-blue-600 rounded-full flex items-center justify-center mx-auto mb-3">
                        <Heart size={24} className="text-white" />
                      </div>
                      <h4 className="font-semibold text-gray-800 text-sm">{category.name}</h4>
                    </Link>
                  </motion.div>
                ))}
              </div>
            </div>
          </motion.section>
        )}
      </AnimatePresence>

      {/* Deal of the Day */}
      <section className="bg-gradient-to-r from-red-50 to-orange-50 py-16">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-center mb-12"
          >
            <h2 className="text-4xl font-bold text-gray-800 mb-4">Deal of the Day</h2>
            <p className="text-xl text-gray-600">Limited time offers on premium medicines</p>
          </motion.div>

          {dealProducts.length > 0 && (
            <div className="relative max-w-4xl mx-auto">
              <div className="bg-white rounded-3xl shadow-2xl overflow-hidden">
                <AnimatePresence mode="wait">
                  <motion.div
                    key={currentDeal}
                    initial={{ opacity: 0, x: 100 }}
                    animate={{ opacity: 1, x: 0 }}
                    exit={{ opacity: 0, x: -100 }}
                    transition={{ duration: 0.3 }}
                    className="grid md:grid-cols-2 gap-8 p-8"
                  >
                    <div className="relative">
                      <div className="absolute top-4 left-4 bg-red-600 text-white px-4 py-2 rounded-full font-bold text-lg z-10">
                        -{dealProducts[currentDeal].discount}%
                      </div>
                      <img
                        src={dealProducts[currentDeal].imageUrl || `/api/placeholder/400/300?text=${encodeURIComponent(dealProducts[currentDeal].name)}`}
                        alt={dealProducts[currentDeal].name}
                        className="w-full h-64 object-cover rounded-2xl"
                      />
                    </div>
                    
                    <div className="flex flex-col justify-center space-y-6">
                      <div>
                        <h3 className="text-3xl font-bold text-gray-800 mb-2">
                          {dealProducts[currentDeal].name}
                        </h3>
                        <p className="text-gray-600">
                          {dealProducts[currentDeal].description || 'Premium quality medicine at an unbeatable price.'}
                        </p>
                      </div>
                      
                      <div className="space-y-2">
                        <div className="flex items-center gap-4">
                          <span className="text-3xl font-bold text-green-600">
                            {formatPrice(dealProducts[currentDeal].price)}
                          </span>
                          <span className="text-xl text-gray-500 line-through">
                            {formatPrice(dealProducts[currentDeal].originalPrice)}
                          </span>
                        </div>
                        <div className="text-sm text-red-600 font-semibold">
                          You save {formatPrice(dealProducts[currentDeal].originalPrice - dealProducts[currentDeal].price)}!
                        </div>
                      </div>
                      
                      <div className="flex gap-4">
                        <motion.button
                          whileHover={{ scale: 1.05 }}
                          whileTap={{ scale: 0.95 }}
                          onClick={() => handleAddToCart(dealProducts[currentDeal])}
                          className="bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded-xl font-semibold flex items-center gap-2"
                        >
                          <ShoppingCart size={20} />
                          Add to Cart
                        </motion.button>
                        <motion.div
                          whileHover={{ scale: 1.05 }}
                          whileTap={{ scale: 0.95 }}
                        >
                          <Link
                            href={`/products/${dealProducts[currentDeal].id}`}
                            className="border-2 border-blue-600 text-blue-600 hover:bg-blue-600 hover:text-white px-8 py-4 rounded-xl font-semibold inline-block"
                          >
                            View Details
                          </Link>
                        </motion.div>
                      </div>
                      
                      <div className="text-sm text-gray-600 flex items-center gap-2">
                        <Clock size={16} />
                        Offer expires in 23h 59m
                      </div>
                    </div>
                  </motion.div>
                </AnimatePresence>
              </div>

              <button
                onClick={prevDeal}
                className="absolute left-4 top-1/2 -translate-y-1/2 bg-white shadow-lg rounded-full p-3 hover:bg-gray-50"
              >
                <ChevronLeft size={24} />
              </button>
              <button
                onClick={nextDeal}
                className="absolute right-4 top-1/2 -translate-y-1/2 bg-white shadow-lg rounded-full p-3 hover:bg-gray-50"
              >
                <ChevronRight size={24} />
              </button>

              <div className="flex justify-center mt-6 gap-2">
                {dealProducts.map((_, index) => (
                  <button
                    key={index}
                    onClick={() => setCurrentDeal(index)}
                    className={`w-3 h-3 rounded-full transition-colors ${
                      index === currentDeal ? 'bg-blue-600' : 'bg-gray-300'
                    }`}
                  />
                ))}
              </div>
            </div>
          )}
        </div>
      </section>

      {/* How to Order */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl font-bold text-gray-800 mb-4">How to Order</h2>
            <p className="text-xl text-gray-600">Simple steps to get your medicines delivered</p>
          </motion.div>

          <div className="max-w-4xl mx-auto">
            <div className="relative">
              <div className="absolute left-1/2 transform -translate-x-1/2 w-1 h-full bg-blue-600 hidden md:block"></div>
              
              {[
                {
                  step: 1,
                  title: "Browse & Select",
                  description: "Browse our extensive catalog and add items to your cart",
                  icon: "🛒",
                  image: "/api/placeholder/300/200?text=Browse+Products"
                },
                {
                  step: 2,
                  title: "Review Your Order",
                  description: "Check your items and proceed to checkout via WhatsApp",
                  icon: "📋",
                  image: "/api/placeholder/300/200?text=Review+Order"
                },
                {
                  step: 3,
                  title: "Confirm & Pay",
                  description: "Confirm your order details and choose your payment method",
                  icon: "💳",
                  image: "/api/placeholder/300/200?text=Confirm+Payment"
                },
                {
                  step: 4,
                  title: "Fast Delivery",
                  description: "Receive your medicines at your doorstep within hours",
                  icon: "🚚",
                  image: "/api/placeholder/300/200?text=Fast+Delivery"
                }
              ].map((item, index) => (
                <motion.div
                  key={item.step}
                  initial={{ opacity: 0, y: 50 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: index * 0.2 }}
                  className={`flex items-center mb-12 ${
                    index % 2 === 0 ? 'md:flex-row' : 'md:flex-row-reverse'
                  }`}
                >
                  <div className={`w-full md:w-5/12 ${index % 2 === 0 ? 'md:pr-8' : 'md:pl-8'}`}>
                    <div className="bg-white border-2 border-blue-600 rounded-2xl p-6 shadow-lg">
                      <div className="flex items-center mb-4">
                        <div className="w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-lg mr-4">
                          {item.step}
                        </div>
                        <h3 className="text-2xl font-bold text-gray-800">{item.title}</h3>
                      </div>
                      <p className="text-gray-600 mb-4">{item.description}</p>
                      <div className="text-4xl">{item.icon}</div>
                    </div>
                  </div>
                  
                  <div className="hidden md:flex w-2/12 justify-center">
                    <div className="w-4 h-4 bg-blue-600 rounded-full border-4 border-white shadow-lg"></div>
                  </div>
                  
                  <div className={`w-full md:w-5/12 ${index % 2 === 0 ? 'md:pl-8' : 'md:pr-8'} mt-4 md:mt-0`}>
                    <img
                      src={item.image}
                      alt={item.title}
                      className="w-full h-48 object-cover rounded-2xl shadow-lg"
                    />
                  </div>
                </motion.div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Featured Brands */}
      <section className="py-8 bg-gradient-to-r from-gray-50 to-blue-50 overflow-hidden">
        <div className="container mx-auto px-4 mb-8">
          <h2 className="text-3xl font-bold text-center text-gray-800">Trusted Brands</h2>
        </div>
        
        <div className="relative">
          <motion.div
            animate={{ x: [0, -1920] }}
            transition={{ duration: 30, repeat: Infinity, ease: "linear" }}
            className="flex gap-12 items-center whitespace-nowrap"
            style={{ width: 'calc(200% + 100px)' }}
          >
            {[...FEATURED_BRANDS, ...FEATURED_BRANDS].map((brand, index) => (
              <div
                key={`${brand}-${index}`}
                className="bg-white rounded-xl px-8 py-4 shadow-md border border-gray-200 flex-shrink-0"
              >
                <span className="text-xl font-bold text-gray-800">{brand}</span>
              </div>
            ))}
          </motion.div>
        </div>
      </section>

      {/* Product Categories */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          {categories.slice(0, 3).map((category, categoryIndex) => {
            const categoryProducts = products.filter(product => 
              product.categories?.some(cat => cat.id === category.id)
            ).slice(0, 4);

            if (categoryProducts.length === 0) return null;

            return (
              <motion.div
                key={category.id}
                initial={{ opacity: 0, y: 50 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: categoryIndex * 0.2 }}
                className="mb-16"
              >
                <div className="flex justify-between items-center mb-8">
                  <h2 className="text-3xl font-bold text-gray-800">{category.name}</h2>
                  <Link
                    href={`/products?category=${category.id}`}
                    className="text-blue-600 hover:text-blue-700 font-semibold flex items-center gap-2"
                  >
                    View All <ArrowRight size={20} />
                  </Link>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                  {categoryProducts.map((product, index) => (
                    <motion.div
                      key={product.id}
                      initial={{ opacity: 0, y: 20 }}
                      animate={{ opacity: 1, y: 0 }}
                      transition={{ delay: categoryIndex * 0.2 + index * 0.1 }}
                      whileHover={{ y: -5 }}
                      className="bg-white border border-gray-200 rounded-2xl overflow-hidden shadow-lg hover:shadow-xl transition-all duration-300"
                    >
                      <div className="relative">
                        <img
                          src={product.imageUrl || `/api/placeholder/300/200?text=${encodeURIComponent(product.name)}`}
                          alt={product.name}
                          className="w-full h-48 object-cover"
                        />
                        <div className="absolute top-4 right-4 bg-white rounded-full p-2 shadow-md">
                          <Heart size={16} className="text-gray-400 hover:text-red-500 cursor-pointer" />
                        </div>
                      </div>
                      
                      <div className="p-6">
                        <h3 className="text-lg font-semibold text-gray-800 mb-2 line-clamp-2">
                          {product.name}
                        </h3>
                        <p className="text-gray-600 text-sm mb-4 line-clamp-2">
                          {product.description || 'Quality medicine for your health needs'}
                        </p>
                        
                        <div className="flex items-center justify-between">
                          <div className="text-2xl font-bold text-green-600">
                            {formatPrice(product.price)}
                          </div>
                          <motion.button
                            whileHover={{ scale: 1.05 }}
                            whileTap={{ scale: 0.95 }}
                            onClick={() => handleAddToCart(product)}
                            className="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center gap-2 font-semibold"
                          >
                            <ShoppingCart size={16} />
                            Add
                          </motion.button>
                        </div>
                        
                        <div className="mt-4 flex items-center justify-between text-sm text-gray-600">
                          <span>Stock: {product.stock}</span>
                          <div className="flex items-center gap-1">
                            <Star size={14} className="text-yellow-400 fill-current" />
                            <span>4.{Math.floor(Math.random() * 5) + 5}</span>
                          </div>
                        </div>
                      </div>
                    </motion.div>
                  ))}
                </div>
              </motion.div>
            );
          })}
        </div>
      </section>

      {/* Contact CTA */}
      <section className="bg-gradient-to-r from-blue-600 to-green-600 text-white py-16">
        <div className="container mx-auto px-4 text-center">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="max-w-3xl mx-auto"
          >
            <h2 className="text-4xl font-bold mb-6">Need Help or Have Questions?</h2>
            <p className="text-xl mb-8 text-blue-100">
              Our qualified pharmacists are here to assist you with expert advice and personalized care.
            </p>
            
            <div className="grid md:grid-cols-2 gap-8 mb-8">
              <div className="bg-white/10 backdrop-blur-lg rounded-2xl p-6 border border-white/20">
                <Phone size={32} className="text-blue-300 mx-auto mb-4" />
                <h3 className="text-xl font-bold mb-2">Call Us</h3>
                <p className="text-blue-100">+256 751 360 385</p>
              </div>
              
              <div className="bg-white/10 backdrop-blur-lg rounded-2xl p-6 border border-white/20">
                <MapPin size={32} className="text-blue-300 mx-auto mb-4" />
                <h3 className="text-xl font-bold mb-2">Visit Us</h3>
                <p className="text-blue-100">Kampala, Central Region</p>
              </div>
            </div>
            
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <motion.div
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
              >
                <Link
                  href="/contact"
                  className="bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded-xl font-semibold inline-block"
                >
                  Contact Us
                </Link>
              </motion.div>
              
              <motion.div
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
              >
                <a
                  href="https://wa.me/256751360385"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="border-2 border-white text-white hover:bg-white hover:text-blue-600 px-8 py-4 rounded-xl font-semibold inline-block"
                >
                  WhatsApp Us
                </a>
              </motion.div>
            </div>
          </motion.div>
        </div>
      </section>

    </div>
  );
}