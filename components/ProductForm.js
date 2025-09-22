'use client';

import { useState, useEffect } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import ImageUploader from '@components/ImageUploader';
import Button from '@components/ui/Button';

const schema = z.object({
  name: z.string().min(1, 'Name is required'),
  description: z.string().optional(),
  price: z.number().min(0, 'Price must be non-negative'),
  stock: z.number().int().min(0, 'Stock must be non-negative'),
  categoryIds: z.array(z.number()).min(1, 'At least one category is required'),
});

export default function ProductForm({ product }) {
  const { register, handleSubmit, setValue, formState: { errors } } = useForm({
    resolver: zodResolver(schema),
    defaultValues: {
      name: product?.name || '',
      description: product?.description || '',
      price: product?.price || 0,
      stock: product?.stock || 0,
      categoryIds: product?.categories?.map(c => c.category.id) || [], // Fixed mapping
    },
  });

  const [categories, setCategories] = useState([]);
  const [imageUrl, setImageUrl] = useState(product?.imageUrl || '');

  useEffect(() => {
    async function fetchCategories() {
      const response = await fetch('/api/categories');
      const data = await response.json();
      setCategories(data);
    }
    fetchCategories();
  }, []);

  const onSubmit = async (data) => {
    const payload = {
      ...data,
      imageUrl,
      categoryIds: data.categoryIds,
    };
    const method = product ? 'PUT' : 'POST';
    const url = product ? `/api/products/${product.id}` : '/api/products';
    await fetch(url, {
      method,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });
    // Redirect or show success message (e.g., redirect to /admin/products)
    window.location.href = '/admin/products';
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      <div>
        <label className="text-neutral-dark">Name</label>
        <input {...register('name')} className="w-full p-2 border rounded" />
        {errors.name && <p className="text-red-500">{errors.name.message}</p>}
      </div>
      <div>
        <label className="text-neutral-dark">Description</label>
        <textarea {...register('description')} className="w-full p-2 border rounded" />
      </div>
      <div>
        <label className="text-neutral-dark">Price</label>
        <input
          type="number"
          step="0.01"
          {...register('price', { valueAsNumber: true })}
          className="w-full p-2 border rounded"
        />
        {errors.price && <p className="text-red-500">{errors.price.message}</p>}
      </div>
      <div>
        <label className="text-neutral-dark">Stock</label>
        <input
          type="number"
          {...register('stock', { valueAsNumber: true })}
          className="w-full p-2 border rounded"
        />
        {errors.stock && <p className="text-red-500">{errors.stock.message}</p>}
      </div>
      <div>
        <label className="text-neutral-dark">Categories</label>
        <select
          multiple
          {...register('categoryIds', { valueAsNumber: true })}
          className="w-full p-2 border rounded"
        >
          {categories.map(category => (
            <option key={category.id} value={category.id}>
              {category.name}
            </option>
          ))}
        </select>
        {errors.categoryIds && <p className="text-red-500">{errors.categoryIds.message}</p>}
      </div>
      <ImageUploader onUpload={(url) => setImageUrl(url)} />
      <Button type="submit">Save Product</Button>
    </form>
  );
}