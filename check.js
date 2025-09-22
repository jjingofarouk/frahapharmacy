// check-create.js
const fs = require("fs");
const path = require("path");

// All files you want to check/create
const files = [
  "app/api/upload/route.js",
  "app/api/products/route.js",
  "app/api/orders/route.js",
  "app/admin/dashboard/page.js",
  "app/admin/products/page.js",
  "app/admin/products/add/page.js",
  "app/admin/products/edit/[id]/page.js",
  "app/admin/products/delete/[id]/page.js",
  "app/admin/categories/page.js",
  "app/admin/categories/add/page.js",
  "app/admin/categories/edit/[id]/page.js",
  "app/admin/orders/page.js",
  "app/admin/orders/[id]/page.js",
  "app/admin/inventory/page.js",
  "app/admin/layout.js",
  "app/auth/login/page.js",
  "app/auth/signup/page.js",
  "app/auth/logout/page.js",
  "app/cart/page.js",
  "app/checkout/page.js",
  "app/products/page.js",
  "app/products/[id]/page.js",
  "app/about/page.js",
  "app/contact/page.js",
  "app/globals.css",
  "app/layout.js",
  "app/page.js",
  "app/not-found.js",
  "app/favicon.ico",
  "components/ui/Button.js",
  "components/ui/Card.js",
  "components/ui/Input.js",
  "components/ui/Select.js",
  "components/ui/Modal.js",
  "components/ui/Alert.js",
  "components/AdminSidebar.js",
  "components/Navbar.js",
  "components/Footer.js",
  "components/ProductCard.js",
  "components/CartItem.js",
  "components/ProductForm.js",
  "components/CategoryForm.js",
  "components/OrderCard.js",
  "components/ImageUploader.js",
  "lib/supabase.js",
  "lib/cloudinary.js",
  "lib/auth.js",
  "lib/utils.js",
  "lib/cart.js",
  "lib/whatsapp.js",
  "prisma/schema.prisma",
  "public/images/logo.png",
  "public/images/placeholder.jpg",
  "public/favicon.ico",
  "stores/cartStore.js",
  "stores/authStore.js",
  "tailwind.config.js",
  "postcss.config.js",
  "next.config.js",
  "package.json",
  ".env.local",
  ".gitignore",
  "README.md"
];

// Loop through files and create missing ones
files.forEach((file) => {
  const filePath = path.join(process.cwd(), file);

  if (!fs.existsSync(filePath)) {
    fs.mkdirSync(path.dirname(filePath), { recursive: true });
    fs.writeFileSync(filePath, ""); // empty file
    console.log(`✅ Created missing: ${file}`);
  } else {
    console.log(`✔️ Already exists: ${file}`);
  }
});
