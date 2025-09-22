'use client'
import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import Input from '@components/ui/Input';
import Button from '@components/ui/Button';
import { useRouter } from 'next/navigation';

const schema = z.object({
  name: z.string().min(1, 'Name is required'),
  description: z.string().optional(),
});

export default function CategoryForm({ category = {} }) {
  const router = useRouter();
  const { register, handleSubmit, formState: { errors } } = useForm({
    resolver: zodResolver(schema),
    defaultValues: {
      name: category.name || '',
      description: category.description || '',
    },
  });

  const onSubmit = async (data) => {
    const method = category.id ? 'PUT' : 'POST';
    const url = category.id ? `/api/categories/${category.id}` : '/api/categories';
    await fetch(url, {
      method,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    });
    router.push('/admin/categories');
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      <Input
        label="Name"
        {...register('name')}
        error={errors.name?.message}
      />
      <Input
        label="Description"
        {...register('description')}
        error={errors.description?.message}
      />
      <Button type="submit" className="bg-pharmacy-green text-white">Save Category</Button>
    </form>
  );
}