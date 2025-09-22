/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.{js,jsx,ts,tsx}",
    "./components/**/*.{js,jsx,ts,tsx}",
    "./lib/**/*.{js,jsx,ts,tsx}",
    "./stores/**/*.{js,jsx,ts,tsx}",
    "./services/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
colors: {
  // high-end pharmacy palette (keys unchanged)
  'primary-white': '#F3F7F6',  // soft off-white, gentle for backgrounds
  'primary-blue' : '#14555C',  // dark teal blue, modern and calming
  'accent-blue'  : '#C75C2E',  // deep burnt orange for bold accents/CTAs
  'success-green': '#1E7F6B',  // rich teal-green, trusted for success
  'light-green'  : '#D9F5EC',  // pale mint green for soft surfaces
  'neutral-gray' : '#EAF0EF',  // subtle neutral for forms/areas
  'text-dark'    : '#14323A',  // deep blue-charcoal for headings/body
  'text-muted'   : '#6B8793',  // cool muted blue-gray for secondary text
  'border-light' : '#CFE3DF',  // pale teal-gray for borders
  'hover-blue'   : '#0C3B43',  // even darker teal for hover states
  'dark-orange'  : '#A23B14',  // dark orange for highlights or warnings
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
