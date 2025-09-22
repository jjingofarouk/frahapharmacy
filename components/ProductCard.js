import Image from 'next/image';
import Link from 'next/link';
import { ShoppingCart, Star } from 'lucide-react';

export default function ProductCard({ product, admin = false }) {
  return (
    <div className="bg-white border border-border-light rounded-xl shadow-soft hover:shadow-medium transition-all duration-300 overflow-hidden group">
      {/* Product Image */}
      <div className="relative overflow-hidden">
        <Image
          src={product.imageUrl || '/images/placeholder.jpg'}
          alt={product.name}
          width={300}
          height={250}
          className="w-full h-64 object-cover group-hover:scale-105 transition-transform duration-300"
        />
        {product.stock <= 5 && product.stock > 0 && (
          <div className="absolute top-3 left-3 bg-amber-500 text-white text-xs font-medium px-2 py-1 rounded-full">
            Low Stock
          </div>
        )}
        {product.stock === 0 && (
          <div className="absolute top-3 left-3 bg-red-500 text-white text-xs font-medium px-2 py-1 rounded-full">
            Out of Stock
          </div>
        )}
      </div>

      {/* Product Details */}
      <div className="p-6">
        <div className="mb-4">
          <h3 className="text-lg font-semibold text-text-dark mb-2 line-clamp-2 group-hover:text-primary-blue transition-colors duration-200">
            {product.name}
          </h3>
          
          {/* Categories */}
          {product.categories && product.categories.length > 0 && (
            <div className="flex flex-wrap gap-1 mb-3">
              {product.categories.slice(0, 2).map((category, index) => (
                <span 
                  key={category.id || index}
                  className="text-xs bg-light-green text-success-green px-2 py-1 rounded-full"
                >
                  {category.name}
                </span>
              ))}
              {product.categories.length > 2 && (
                <span className="text-xs text-text-muted">
                  +{product.categories.length - 2} more
                </span>
              )}
            </div>
          )}

          {/* Rating */}
          <div className="flex items-center gap-1 mb-3">
            {[...Array(5)].map((_, i) => (
              <Star 
                key={i} 
                size={14} 
                className={i < 4 ? "text-amber-400 fill-current" : "text-gray-300"} 
              />
            ))}
            <span className="text-sm text-text-muted ml-1">(4.0)</span>
          </div>
        </div>

        {/* Price and Stock */}
        <div className="flex items-center justify-between mb-4">
          <div className="text-2xl font-bold text-primary-blue">
            UGX {product.price.toLocaleString()}
          </div>
          <div className="text-sm text-text-muted">
            {product.stock > 0 ? `${product.stock} in stock` : 'Out of stock'}
          </div>
        </div>

        {/* Action Buttons */}
        <div className="flex gap-3">
          {admin ? (
            <Link 
              href={`/admin/products/edit/${product.id}`} 
              className="flex-1 text-center bg-primary-blue hover:bg-hover-blue text-white font-medium py-2.5 px-4 rounded-lg transition-colors duration-200"
            >
              Edit Product
            </Link>
          ) : (
            <>
              <Link 
                href={`/products/${product.id}`} 
                className="flex-1 text-center bg-accent-blue hover:bg-blue-400 text-primary-blue hover:text-white font-medium py-2.5 px-4 rounded-lg transition-colors duration-200"
              >
                View Details
              </Link>
              <button 
                className="bg-success-green hover:bg-green-600 text-white p-2.5 rounded-lg transition-colors duration-200 disabled:bg-gray-300 disabled:cursor-not-allowed"
                disabled={product.stock === 0}
                title={product.stock === 0 ? "Out of stock" : "Add to cart"}
              >
                <ShoppingCart size={18} />
              </button>
            </>
          )}
        </div>
      </div>
    </div>
  );
}