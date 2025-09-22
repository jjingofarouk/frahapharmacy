import Link from 'next/link';
import { PrismaClient } from '@prisma/client';
import ProductCard from '@components/ProductCard';
import { Shield, Heart, Clock, CheckCircle, Users, Award } from 'lucide-react';

const prisma = new PrismaClient();

export default async function Home() {
  const products = await prisma.product.findMany({
    include: { categories: { include: { category: true } } },
    take: 6,
  });

  const formattedProducts = products.map(product => ({
    ...product,
    categories: product.categories.map(pc => pc.category),
  }));

  return (
    <div className="min-h-screen">
      {/* Hero Section */}
      <section className="bg-primary-blue text-white">
        <div className="container-max section-padding">
          <div className="grid md:grid-cols-2 gap-12 items-center">
            <div>
              <h1 className="text-5xl font-bold mb-6 leading-tight">
                Welcome to <span className="text-accent-blue">Fraha Pharmacy</span>
              </h1>
              <p className="text-xl mb-8 text-blue-100 leading-relaxed">
                Your trusted healthcare partner providing quality medications and professional pharmaceutical services with care you can count on.
              </p>
              <div className="flex flex-col sm:flex-row gap-4">
                <Link href="/products" className="btn-primary inline-block text-center">
                  Browse Products
                </Link>
                <Link href="/contact" className="bg-transparent border-2 border-white text-white hover:bg-white hover:text-primary-blue font-medium py-3 px-6 rounded-lg transition-colors duration-200">
                  Contact Us
                </Link>
              </div>
            </div>
            <div className="relative">
              <div className="bg-accent-blue/20 rounded-2xl p-8 backdrop-blur-sm">
                <div className="text-center space-y-4">
                  <Shield size={64} className="mx-auto text-accent-blue" />
                  <h3 className="text-2xl font-semibold">Licensed & Trusted</h3>
                  <p className="text-blue-100">Fully licensed pharmacy with qualified pharmacists</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="bg-neutral-gray">
        <div className="container-max section-padding">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-text-dark mb-4">Why Choose Fraha Pharmacy?</h2>
            <p className="text-xl text-text-muted max-w-2xl mx-auto">
              We're committed to providing exceptional pharmaceutical care with the highest standards of service.
            </p>
          </div>
          
          <div className="grid md:grid-cols-3 gap-8">
            <div className="text-center p-8 bg-white rounded-xl shadow-soft hover:shadow-medium transition-shadow duration-200">
              <div className="w-16 h-16 bg-light-green rounded-full flex items-center justify-center mx-auto mb-6">
                <Heart size={32} className="text-success-green" />
              </div>
              <h3 className="text-2xl font-semibold text-text-dark mb-4">Professional Care</h3>
              <p className="text-text-muted leading-relaxed">
                Our qualified pharmacists provide expert consultation and personalized healthcare advice.
              </p>
            </div>

            <div className="text-center p-8 bg-white rounded-xl shadow-soft hover:shadow-medium transition-shadow duration-200">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-6">
                <Clock size={32} className="text-primary-blue" />
              </div>
              <h3 className="text-2xl font-semibold text-text-dark mb-4">Quick Service</h3>
              <p className="text-text-muted leading-relaxed">
                Fast prescription filling and efficient service to get you the medications you need quickly.
              </p>
            </div>

            <div className="text-center p-8 bg-white rounded-xl shadow-soft hover:shadow-medium transition-shadow duration-200">
              <div className="w-16 h-16 bg-light-green rounded-full flex items-center justify-center mx-auto mb-6">
                <CheckCircle size={32} className="text-success-green" />
              </div>
              <h3 className="text-2xl font-semibold text-text-dark mb-4">Quality Assured</h3>
              <p className="text-text-muted leading-relaxed">
                All medications sourced from verified suppliers with proper storage and handling protocols.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Featured Products */}
      <section className="bg-white">
        <div className="container-max section-padding">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-text-dark mb-4">Featured Products</h2>
            <p className="text-xl text-text-muted max-w-2xl mx-auto">
              Discover our most popular healthcare products and medications.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            {formattedProducts.map(product => (
              <ProductCard key={product.id} product={product} />
            ))}
          </div>
          
          <div className="text-center">
            <Link href="/products" className="btn-primary inline-block">
              View All Products
            </Link>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="bg-primary-blue text-white">
        <div className="container-max section-padding">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            <div>
              <div className="text-4xl font-bold text-accent-blue mb-2">10+</div>
              <div className="text-blue-100">Years of Experience</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-accent-blue mb-2">5000+</div>
              <div className="text-blue-100">Happy Customers</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-accent-blue mb-2">1000+</div>
              <div className="text-blue-100">Products Available</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-accent-blue mb-2">24/7</div>
              <div className="text-blue-100">Customer Support</div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="bg-light-green">
        <div className="container-max section-padding text-center">
          <h2 className="text-4xl font-bold text-text-dark mb-6">
            Ready to Experience Better Healthcare?
          </h2>
          <p className="text-xl text-text-muted mb-8 max-w-2xl mx-auto">
            Visit Fraha Pharmacy today and discover why thousands of customers trust us with their healthcare needs.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/products" className="btn-secondary inline-block">
              Shop Now
            </Link>
            <Link href="/about" className="bg-white text-text-dark hover:bg-gray-50 font-medium py-3 px-6 rounded-lg transition-colors duration-200 border border-border-light">
              Learn More
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}