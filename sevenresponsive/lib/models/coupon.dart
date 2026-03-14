import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class Coupon {
  final String id;
  final String code;
  final String title;
  final String description;
  final double discount;
  final String discountType; // 'percentage' or 'fixed'
  final DateTime? expiryDate;
  final Color color;
  final bool isUsed;

  Coupon({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.discount,
    required this.discountType,
    this.expiryDate,
    required this.color,
    this.isUsed = false,
  });

  String get discountText {
    return discountType == 'percentage'
        ? '${discount.toStringAsFixed(0)}% OFF'
        : '฿${discount.toStringAsFixed(0)} OFF';
  }

  bool get isExpired {
    if (expiryDate == null) return false;
    return DateTime.now().isAfter(expiryDate!);
  }
}

class CouponData {
  static List<Coupon> getCoupons() {
    final now = DateTime.now();
    return [
      Coupon(
        id: '1',
        code: 'WELCOME50',
        title: 'Welcome Discount',
        description: 'Get 50% off on your first order',
        discount: 50,
        discountType: 'percentage',
        expiryDate: now.add(const Duration(days: 7)),
        color: AppColors.primaryRed,
      ),
      Coupon(
        id: '2',
        code: 'FRESH20',
        title: 'Fresh Food Deal',
        description: '฿20 off on fresh food items',
        discount: 20,
        discountType: 'fixed',
        expiryDate: now.add(const Duration(days: 14)),
        color: AppColors.primaryGreen,
      ),
      Coupon(
        id: '3',
        code: 'COFFEE15',
        title: 'Coffee Lover',
        description: '15% off on all coffee drinks',
        discount: 15,
        discountType: 'percentage',
        expiryDate: now.add(const Duration(days: 30)),
        color: AppColors.primaryOrange,
      ),
      Coupon(
        id: '4',
        code: 'FREEDELIVERY',
        title: 'Free Delivery',
        description: 'Free delivery on orders over ฿200',
        discount: 0,
        discountType: 'percentage',
        expiryDate: now.add(const Duration(days: 3)),
        color: AppColors.primaryYellow,
      ),
    ];
  }
}
