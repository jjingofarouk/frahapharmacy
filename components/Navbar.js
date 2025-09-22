'use client';

import { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import { 
  ShoppingCart, 
  Menu, 
  X, 
  Search, 
  ChevronDown, 
  MapPin,
  Phone,
  Star,
  User
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

export default function Navbar() {
  const { cart, getTotal } = useCartStore();
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [showSearchResults, setShowSearchResults] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [categories, setCategories] = useState([]);
  const [products, setProducts] = useState([]);
  const [selectedCurrency, setSelectedCurrency] = useState('UGX');
  const [showCurrencyDropdown, setShowCurrencyDropdown] = useState(false);
  const [showCategoriesMenu, setShowCategoriesMenu] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  
  const searchRef = useRef(null);
  const searchResultsRef = useRef(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setIsLoading(true);
        const [productsRes, categoriesRes] = await Promise.all([
          fetch('/api/products'),
          fetch('/api/categories')
        ]);
        
        if (!productsRes.ok) throw new Error('Failed to fetch products');
        if (!categoriesRes.ok) throw new Error('Failed to fetch categories');
        
        const productsData = await productsRes.json();
        const categoriesData = await categoriesRes.json();
        
        // Handle case where API returns error object
        if (productsData.error) {
          console.error('Products API error:', productsData.error);
          setProducts([]);
        } else if (Array.isArray(productsData)) {
          setProducts(productsData);
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
      } finally {
        setIsLoading(false);
      }
    };

    fetchData();
  }, []);

  useEffect(() => {
    if (searchQuery.length > 0) {
      setIsLoading(true);
      const filteredProducts = products.filter(product => {
        const matchesQuery = product.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                           (product.description && product.description.toLowerCase().includes(searchQuery.toLowerCase()));
        
        if (selectedCategory === 'all') return matchesQuery;
        
        return matchesQuery && product.categories?.some(cat => 
          cat.id === parseInt(selectedCategory)
        );
      });
      
      setSearchResults(filteredProducts.slice(0, 8));
      setShowSearchResults(true);
      setIsLoading(false);
    } else {
      setSearchResults([]);
      setShowSearchResults(false);
    }
  }, [searchQuery, selectedCategory, products]);

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (searchRef.current && !searchRef.current.contains(event.target) &&
          searchResultsRef.current && !searchResultsRef.current.contains(event.target)) {
        setShowSearchResults(false);
      }
    };

    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const formatPrice = (price) => {
    const currency = CURRENCIES.find(c => c.code === selectedCurrency);
    const convertedPrice = price * currency.rate;
    
    if (selectedCurrency === 'UGX') {
      return `${currency.symbol} ${Math.round(convertedPrice).toLocaleString()}`;
    }
    return `${currency.symbol}${convertedPrice.toFixed(2)}`;
  };

  const cartTotal = getTotal();
  const cartCount = cart.reduce((sum, item) => sum + item.quantity, 0);

  return (
    <>
      {/* Top Bar */}
      <div className="bg-primary-blue text-white text-sm py-2 hidden md:block">
        <div className="container mx-auto px-4 flex justify-between items-center">
          <div className="flex items-center space-x-6">
            <div className="flex items-center space-x-2">
              <Phone size={14} />
              <span>+256 751 360 385</span>
            </div>
            <div className="flex items-center space-x-2">
              <MapPin size={14} />
              <span>Kampala, Central Region</span>
            </div>
          </div>
          
          <div className="flex items-center space-x-4">
            <div className="flex items-center space-x-1">
              <Star size={14} className="text-yellow-400 fill-current" />
              <span>Licensed Pharmacy</span>
            </div>
            
            <div className="relative">
              <button
                onClick={() => setShowCurrencyDropdown(!showCurrencyDropdown)}
                className="flex items-center space-x-1 hover:text-accent-blue transition-colors"
              >
                <span>{selectedCurrency}</span>
                <ChevronDown size={14} />
              </button>
              
              {showCurrencyDropdown && (
                <div className="absolute right-0 top-full mt-2 bg-white text-gray-800 rounded-lg shadow-lg border border-gray-200 z-50 w-48">
                  <div className="py-2">
                    {CURRENCIES.map(currency => (
                      <button
                        key={currency.code}
                        onClick={() => {
                          setSelectedCurrency(currency.code);
                          setShowCurrencyDropdown(false);
                        }}
                        className="w-full text-left px-4 py-2 hover:bg-gray-100 flex justify-between"
                      >
                        <span>{currency.code}</span>
                        <span>{currency.symbol}</span>
                      </button>
                    ))}
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Main Navigation */}
      <nav className="bg-white border-b border-gray-200 sticky top-0 z-40 shadow-lg">
        <div className="container mx-auto px-4">
          <div className="flex justify-between items-center py-4">
            {/* Logo */}
            <Link href="/" className="flex items-center space-x-3 flex-shrink-0">
              <div className="w-10 h-10 bg-primary-blue rounded-lg flex items-center justify-center">
                <span className="text-white font-bold">F</span>
              </div>
              <div className="hidden sm:block">
                <div className="text-xl font-bold text-gray-800">Fraha Pharmacy</div>
                <div className="text-xs text-gray-600">Your Health Partner</div>
              </div>
            </Link>

            {/* Search Bar - Desktop */}
            <div className="hidden md:flex flex-1 max-w-2xl mx-8 relative" ref={searchRef}>
              <div className="w-full relative">
                <div className="flex">
                  <select
                    value={selectedCategory}
                    onChange={(e) => setSelectedCategory(e.target.value)}
                    className="bg-gray-50 border border-r-0 border-gray-300 rounded-l-lg px-4 py-3 text-sm focus:outline-none focus:border-primary-blue"
                  >
                    <option value="all">All</option>
                    {categories.map(category => (
                      <option key={category.id} value={category.id}>
                        {category.name}
                      </option>
                    ))}
                  </select>

                  <div className="relative flex-1">
                    <input
                      type="text"
                      placeholder="Search Fraha products..."
                      value={searchQuery}
                      onChange={(e) => setSearchQuery(e.target.value)}
                      className="w-full px-4 py-3 border-t border-b border-gray-300 focus:outline-none focus:border-primary-blue text-sm"
                    />
                    {isLoading && (
                      <div className="absolute right-12 top-1/2 transform -translate-y-1/2">
                        <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-primary-blue"></div>
                      </div>
                    )}
                  </div>

                  <button className="bg-primary-blue hover:bg-blue-700 text-white px-6 py-3 rounded-r-lg transition-colors">
                    <Search size={18} />
                  </button>
                </div>

                {/* Search Results Dropdown */}
                {showSearchResults && (
                  <div 
                    ref={searchResultsRef}
                    className="absolute top-full left-0 right-0 mt-2 bg-white border border-gray-200 rounded-lg shadow-xl z-50 max-h-96 overflow-y-auto"
                  >
                    {searchResults.length > 0 ? (
                      <div className="py-2">
                        <div className="px-4 py-2 text-sm text-gray-500 border-b">
                          {searchResults.length} result{searchResults.length !== 1 ? 's' : ''} found
                        </div>
                        {searchResults.map(product => (
                          <Link
                            key={product.id}
                            href={`/products/${product.id}`}
                            onClick={() => setShowSearchResults(false)}
                            className="flex items-center p-4 hover:bg-gray-50 border-b border-gray-100 last:border-b-0"
                          >
                            <img
                              src={product.imageUrl || `/api/placeholder/60/60?text=${encodeURIComponent(product.name)}`}
                              alt={product.name}
                              className="w-12 h-12 object-cover rounded-lg mr-4"
                            />
                            <div className="flex-1">
                              <h3 className="font-medium text-gray-800">{product.name}</h3>
                              <p className="text-sm text-gray-600 line-clamp-1">
                                {product.description || 'Quality medicine for your health needs'}
                              </p>
                              <div className="flex items-center justify-between mt-1">
                                <span className="font-semibold text-green-600">
                                  {formatPrice(product.price)}
                                </span>
                                <span className="text-xs text-gray-500">Stock: {product.stock}</span>
                              </div>
                            </div>
                          </Link>
                        ))}
                        <div className="p-4 border-t bg-gray-50">
                          <Link
                            href={`/products?search=${searchQuery}&category=${selectedCategory}`}
                            className="text-primary-blue hover:text-blue-700 text-sm font-medium flex items-center justify-center"
                            onClick={() => setShowSearchResults(false)}
                          >
                            View all results
                          </Link>
                        </div>
                      </div>
                    ) : (
                      <div className="p-8 text-center text-gray-500">
                        <Search size={48} className="mx-auto mb-4 text-gray-300" />
                        <p>No products found for "{searchQuery}"</p>
                        <p className="text-sm mt-2">Try different keywords or browse our categories</p>
                      </div>
                    )}
                  </div>
                )}
              </div>
            </div>

            {/* Cart and Mobile Menu */}
            <div className="flex items-center space-x-4">
              <div className="relative group">
                <Link
                  href="/cart"
                  className="flex items-center space-x-2 bg-primary-blue hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition-colors duration-200"
                >
                  <ShoppingCart size={20} />
                  <div className="hidden sm:block">
                    <div className="text-sm font-medium">
                      {cartCount} {cartCount !== 1 ? 'items' : 'item'}
                    </div>
                    <div className="text-xs opacity-90">
                      {formatPrice(cartTotal)}
                    </div>
                  </div>
                  {cartCount > 0 && (
                    <div className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-6 h-6 flex items-center justify-center font-bold">
                      {cartCount > 99 ? '99+' : cartCount}
                    </div>
                  )}
                </Link>
                
                {/* Cart Dropdown */}
                <div className="absolute right-0 top-full mt-2 w-80 bg-white border border-gray-200 rounded-lg shadow-xl z-50 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200">
                  <div className="p-4">
                    <h3 className="font-semibold text-gray-800 mb-3">Shopping Cart</h3>
                    {cart.length > 0 ? (
                      <>
                        <div className="space-y-3 max-h-60 overflow-y-auto">
                          {cart.slice(0, 3).map(item => (
                            <div key={item.id} className="flex items-center space-x-3">
                              <img
                                src={item.imageUrl || `/api/placeholder/40/40?text=${encodeURIComponent(item.name)}`}
                                alt={item.name}
                                className="w-10 h-10 object-cover rounded"
                              />
                              <div className="flex-1">
                                <h4 className="text-sm font-medium text-gray-800 line-clamp-1">
                                  {item.name}
                                </h4>
                                <div className="text-xs text-gray-600">
                                  {item.quantity} × {formatPrice(item.price)}
                                </div>
                              </div>
                            </div>
                          ))}
                          {cart.length > 3 && (
                            <div className="text-center text-sm text-gray-600">
                              +{cart.length - 3} more items
                            </div>
                          )}
                        </div>
                        <div className="border-t border-gray-200 mt-4 pt-4">
                          <div className="flex justify-between items-center mb-3">
                            <span className="font-semibold">Total:</span>
                            <span className="font-bold text-green-600">
                              {formatPrice(cartTotal)}
                            </span>
                          </div>
                          <Link
                            href="/cart"
                            className="w-full bg-green-600 hover:bg-green-700 text-white text-center py-2 rounded-lg font-medium transition-colors block"
                          >
                            View Cart
                          </Link>
                        </div>
                      </>
                    ) : (
                      <div className="text-center py-8">
                        <ShoppingCart size={48} className="mx-auto mb-4 text-gray-300" />
                        <p className="text-gray-600">Your cart is empty</p>
                        <Link
                          href="/products"
                          className="inline-block mt-2 text-primary-blue hover:text-blue-700 font-medium"
                        >
                          Start Shopping
                        </Link>
                      </div>
                    )}
                  </div>
                </div>
              </div>

              {/* Mobile Menu Button */}
              <button
                className="lg:hidden p-2"
                onClick={() => setIsMenuOpen(!isMenuOpen)}
              >
                {isMenuOpen ? <X size={24} /> : <Menu size={24} />}
              </button>
            </div>
          </div>

          {/* Search Bar - Mobile */}
          <div className="md:hidden pb-4" ref={searchRef}>
            <div className="flex">
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="bg-gray-50 border border-r-0 border-gray-300 rounded-l-lg px-3 py-2 text-sm focus:outline-none focus:border-primary-blue"
              >
                <option value="all">All</option>
                {categories.slice(0, 5).map(category => (
                  <option key={category.id} value={category.id}>
                    {category.name.length > 10 ? category.name.substring(0, 10) + '...' : category.name}
                  </option>
                ))}
              </select>
              <input
                type="text"
                placeholder="Search medicines..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="flex-1 px-3 py-2 border-t border-b border-gray-300 focus:outline-none focus:border-primary-blue text-sm"
              />
              <button className="bg-primary-blue text-white px-4 py-2 rounded-r-lg">
                <Search size={16} />
              </button>
            </div>

            {/* Mobile Search Results */}
            {showSearchResults && (
              <div className="mt-2 bg-white border border-gray-200 rounded-lg shadow-lg max-h-80 overflow-y-auto">
                {searchResults.length > 0 ? (
                  searchResults.slice(0, 5).map(product => (
                    <Link
                      key={product.id}
                      href={`/products/${product.id}`}
                      onClick={() => setShowSearchResults(false)}
                      className="flex items-center p-3 hover:bg-gray-50 border-b border-gray-100 last:border-b-0"
                    >
                      <img
                        src={product.imageUrl || `/api/placeholder/40/40?text=${encodeURIComponent(product.name)}`}
                        alt={product.name}
                        className="w-8 h-8 object-cover rounded mr-3"
                      />
                      <div className="flex-1">
                        <h3 className="text-sm font-medium text-gray-800">{product.name}</h3>
                        <span className="text-sm font-semibold text-green-600">
                          {formatPrice(product.price)}
                        </span>
                      </div>
                    </Link>
                  ))
                ) : (
                  <div className="p-4 text-center text-gray-500">
                    <p className="text-sm">No results found</p>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>

        {/* Mobile Menu */}
        {isMenuOpen && (
          <div className="lg:hidden border-t border-gray-200 bg-white">
            <div className="py-4 px-4 space-y-4">
              <Link
                href="/products"
                className="block text-gray-800 hover:text-primary-blue font-medium transition-colors duration-200"
                onClick={() => setIsMenuOpen(false)}
              >
                Products
              </Link>
              

              
              <Link
                href="/about"
                className="block text-gray-800 hover:text-primary-blue font-medium transition-colors duration-200"
                onClick={() => setIsMenuOpen(false)}
              >
                About
              </Link>
              <Link
                href="/contact"
                className="block text-gray-800 hover:text-primary-blue font-medium transition-colors duration-200"
                onClick={() => setIsMenuOpen(false)}
              >
                Contact
              </Link>
              
              <div className="pt-4 border-t border-gray-200">
                <label className="block text-sm text-gray-600 mb-2">Currency:</label>
                <select
                  value={selectedCurrency}
                  onChange={(e) => setSelectedCurrency(e.target.value)}
                  className="w-full bg-gray-50 border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-primary-blue"
                >
                  {CURRENCIES.map(currency => (
                    <option key={currency.code} value={currency.code}>
                      {currency.code} ({currency.symbol})
                    </option>
                  ))}
                </select>
              </div>

              <div className="pt-4 border-t border-gray-200">
                <div className="text-sm text-gray-600 space-y-2">
                  <div className="flex items-center space-x-2">
                    <Phone size={14} />
                    <span>+256 751 360 385</span>
                  </div>
                  <div className="flex items-center space-x-2">
                    <MapPin size={14} />
                    <span>Kampala, Central Region</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}
      </nav>
    </>
  );
}