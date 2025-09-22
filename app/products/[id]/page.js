'use client';

import { useState, useEffect } from 'react';
import { useCartStore } from '@stores/cartStore';
import Button from '@components/ui/Button';
import Image from 'next/image';

export default function ProductPage({ params }) {
  const [product, setProduct] = useState(null);
  const { addToCart } = useCartStore();

  useEffect(() => {
    async function fetchProduct() {
      const res = await fetch(`/api/products/${params.id}`);
      const data = await res.json();
      setProduct(data);
    }
    fetchProduct();
  }, [params.id]);

  if (!product) return <div>Loading...</div>;

  return (
    <div className="max-w-7xl mx-auto p-4">
      <div className="flex flex-col md:flex-row gap-4">
        <Image
          src={product.imageUrl || '/images/placeholder.jpg'}
          alt={product.name}
          width={300}
          height={300}
        />
        <div>
          <h1 className="text-2xl font-bold">{product.name}</h1>
          <p>UGX {product.price.toLocaleString()}</p>
          <p>{product.description}</p>
          <p>Categories: {product.categories.map(c => c.name).join(', ') || 'None'}</p>
          <p>Stock: {product.stock}</p>
          <Button onClick={() => addToCart(product)}>Add to Cart</Button>
        </div>
      </div>
    </div>
  );
}