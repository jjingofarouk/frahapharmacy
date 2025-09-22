Pharmacy Management System
A full-stack pharmacy management system built with Next.js, Tailwind CSS, Supabase, Prisma, and Cloudinary. Features include a public product catalog, cart with WhatsApp checkout, and an admin panel for managing products, categories, orders, and inventory.
Setup

Install dependencies:
npm install


Set up environment variables in .env.local:
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret


Initialize Prisma and push schema:
npx prisma db push


Run the development server:
npm run dev



Features

Public: Browse products, add to cart, checkout via WhatsApp.
Admin: Manage products, categories, orders, and inventory logs.
Authentication: Admin login/signup with Supabase auth.
Image Upload: Cloudinary for product images.
Colors: Pharmacy Green (#10B981), Dark Blue (#1E3A8A).
