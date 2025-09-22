'use client';
import Link from 'next/link';
import { Phone, Mail, MapPin, Clock } from 'lucide-react';

export default function Footer() {
  return (
    <footer className="bg-primary-blue text-white">
      <div className="container-max">
        {/* Main Footer Content */}
        <div className="py-16 px-6">
          <div className="grid md:grid-cols-4 gap-8">
            {/* Company Info */}
            <div className="col-span-2 md:col-span-1">
              <div className="flex items-center space-x-3 mb-6">
                <div className="w-10 h-10 bg-accent-blue rounded-lg flex items-center justify-center">
                  <span className="text-primary-blue font-bold text-xl">F</span>
                </div>
                <div>
                  <div className="text-xl font-bold">Fraha Pharmacy</div>
                  <div className="text-sm text-blue-200">Your Health Partner</div>
                </div>
              </div>
              <p className="text-blue-200 leading-relaxed mb-6">
                Providing quality healthcare services and medications with professional care you can trust.
              </p>
            </div>

            {/* Quick Links */}
            <div>
              <h3 className="text-lg font-semibold mb-6">Quick Links</h3>
              <ul className="space-y-3">
                <li>
                  <Link href="/products" className="text-blue-200 hover:text-white transition-colors duration-200">
                    Products
                  </Link>
                </li>
                <li>
                  <Link href="/about" className="text-blue-200 hover:text-white transition-colors duration-200">
                    About Us
                  </Link>
                </li>
                <li>
                  <Link href="/contact" className="text-blue-200 hover:text-white transition-colors duration-200">
                    Contact
                  </Link>
                </li>
                <li>
                  <Link href="/cart" className="text-blue-200 hover:text-white transition-colors duration-200">
                    Shopping Cart
                  </Link>
                </li>
              </ul>
            </div>

            {/* Services */}
            <div>
              <h3 className="text-lg font-semibold mb-6">Services</h3>
              <ul className="space-y-3 text-blue-200">
                <li>Prescription Filling</li>
                <li>Health Consultations</li>
                <li>Medication Reviews</li>
                <li>Health Screenings</li>
                <li>Vaccination Services</li>
              </ul>
            </div>

            {/* Contact Info */}
            <div>
              <h3 className="text-lg font-semibold mb-6">Contact Info</h3>
              <div className="space-y-4">
                <div className="flex items-start space-x-3">
                  <Phone size={20} className="text-accent-blue mt-1" />
                  <div>
                    <div className="text-white font-medium">+256 700 123 456</div>
                    <div className="text-blue-200 text-sm">24/7 Support</div>
                  </div>
                </div>
                
                <div className="flex items-start space-x-3">
                  <Mail size={20} className="text-accent-blue mt-1" />
                  <div>
                    <div className="text-white font-medium">info@frahapharmacy.com</div>
                    <div className="text-blue-200 text-sm">Email Support</div>
                  </div>
                </div>
                
                <div className="flex items-start space-x-3">
                  <MapPin size={20} className="text-accent-blue mt-1" />
                  <div>
                    <div className="text-white font-medium">Kampala, Uganda</div>
                    <div className="text-blue-200 text-sm">Central Location</div>
                  </div>
                </div>
                
                <div className="flex items-start space-x-3">
                  <Clock size={20} className="text-accent-blue mt-1" />
                  <div>
                    <div className="text-white font-medium">Mon-Sun: 8AM-10PM</div>
                    <div className="text-blue-200 text-sm">Extended Hours</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom Footer */}
        <div className="border-t border-blue-600 py-6 px-6">
          <div className="flex flex-col md:flex-row justify-between items-center">
            <div className="text-blue-200 text-sm mb-4 md:mb-0">
              &copy; {new Date().getFullYear()} Fraha Pharmacy. All rights reserved.
            </div>
            <div className="flex space-x-6 text-sm">
              <Link href="/privacy" className="text-blue-200 hover:text-white transition-colors duration-200">
                Privacy Policy
              </Link>
              <Link href="/terms" className="text-blue-200 hover:text-white transition-colors duration-200">
                Terms of Service
              </Link>
              <Link href="/licensing" className="text-blue-200 hover:text-white transition-colors duration-200">
                Licensing Info
              </Link>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}