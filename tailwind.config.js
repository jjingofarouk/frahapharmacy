/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.{js,jsx,ts,tsx}",
    "./components/**/*.{js,jsx,ts,tsx}",
    "./lib/**/*.{js,jsx,ts,tsx}",
    "./stores/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
colors: {
  // high-end pharmacy palette (keys unchanged)
  'primary-white': '#F7F6F4',  // super-cool beige for panels/backgrounds
  'primary-blue' : '#0B4A6F',  // deep, calm teal-blue (brand primary)
  'accent-blue'  : '#E58A3A',  // muted saffron / warm orange (CTA / accent)
  'success-green': '#27A36E',  // healthy, trusted green (success states)
  'light-green'  : '#E6F6EA',  // very pale green (soft surfaces / chips)
  'neutral-gray' : '#F5F6F7',  // subtle neutral background (forms / areas)
  'text-dark'    : '#0F1724',  // near-black charcoal for headings/body
  'text-muted'   : '#6B7280',  // cool muted gray for secondary text
  'border-light' : '#E6EAEE',  // cool, pale border color
  'hover-blue'   : '#08314F',  // darker shade of primary-blue for hover
},

      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
      boxShadow: {
        soft: '0 2px 8px rgba(0, 0, 0, 0.06)',
        medium: '0 4px 12px rgba(0, 0, 0, 0.08)',
        strong: '0 8px 24px rgba(0, 0, 0, 0.12)',
      },
      spacing: {
        18: '4.5rem',
        88: '22rem',
      },
    },
  },
  plugins: [],
};
