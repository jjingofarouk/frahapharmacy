'use client'
import React from "react";
import { useForm } from 'react-hook-form';
import { signUp } from '@lib/auth';
import Input from '@components/ui/Input';
import Button from '@components/ui/Button';
import Alert from '@components/ui/Alert';

export default function Signup() {
  const { register, handleSubmit, formState: { errors } } = useForm();
  const [error, setError] = React.useState(null);

  const onSubmit = async (data) => {
    try {
      await signUp(data.email, data.password, data.name);
      window.location.href = '/admin/dashboard';
    } catch (err) {
      setError('Signup failed');
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-neutral-light">
      <div className="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h1 className="text-3xl font-bold text-dark-blue mb-6">Admin Signup</h1>
        {error && <Alert variant="error">{error}</Alert>}
        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <Input
            label="Name"
            {...register('name', { required: 'Name is required' })}
            error={errors.name?.message}
          />
          <Input
            label="Email"
            type="email"
            {...register('email', { required: 'Email is required' })}
            error={errors.email?.message}
          />
          <Input
            label="Password"
            type="password"
            {...register('password', { required: 'Password is required', minLength: { value: 6, message: 'Password must be at least 6 characters' } })}
            error={errors.password?.message}
          />
          <Button type="submit" className="bg-pharmacy-green text-white w-full">Signup</Button>
        </form>
      </div>
    </div>
  );
}