import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final String? badge;
  final bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    this.badge,
    this.isFavorite = false,
  });

  double get discountPercentage {
    if (originalPrice == null || originalPrice == 0) return 0;
    return ((originalPrice! - price) / originalPrice! * 100);
  }
}

class ProductData {
  static List<Product> getFeaturedProducts() {
    return [
      Product(
        id: '1',
        title: 'Slurpee Mango',
        description: 'Refreshing mango slushie',
        price: 25.00,
        originalPrice: 35.00,
        imageUrl: 'assets/images/product_slurpee.jpg',
        badge: 'PROMO',
      ),
      Product(
        id: '2',
        title: 'Coffee Premium',
        description: 'Hot freshly brewed coffee',
        price: 45.00,
        originalPrice: 55.00,
        imageUrl: 'assets/images/product_coffee.png',
        badge: 'SALE',
      ),
      Product(
        id: '3',
        title: 'Sandwich Set',
        description: 'Ham and cheese sandwich',
        price: 59.00,
        imageUrl: 'assets/images/product_sandwich.png',
      ),
      Product(
        id: '4',
        title: 'Chicken Pie',
        description: 'Warm chicken pie',
        price: 35.00,
        originalPrice: 45.00,
        imageUrl: 'assets/images/product_pie.png',
        badge: 'HOT',
      ),
      Product(
        id: '5',
        title: 'Fresh Salad',
        description: 'Garden fresh salad',
        price: 49.00,
        imageUrl: 'assets/images/product_salad.png',
      ),
      Product(
        id: '6',
        title: 'Onigiri Set',
        description: 'Japanese rice balls',
        price: 39.00,
        originalPrice: 49.00,
        imageUrl: 'assets/images/product_onigiri.png',
        badge: 'NEW',
      ),
    ];
  }
}
