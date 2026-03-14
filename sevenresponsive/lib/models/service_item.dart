import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class ServiceItem {
  final String id;
  final String title;
  final String icon;
  final Color color;

  ServiceItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
  });
}

class ServiceItemData {
  static List<ServiceItem> getServices() {
    return [
      ServiceItem(
        id: '1',
        title: 'Delivery',
        icon: 'delivery_dining',
        color: AppColors.primaryGreen,
      ),
      ServiceItem(
        id: '2',
        title: 'Order',
        icon: 'shopping_bag',
        color: AppColors.primaryOrange,
      ),
      ServiceItem(
        id: '3',
        title: 'Coupon',
        icon: 'local_offer',
        color: AppColors.primaryRed,
      ),
      ServiceItem(
        id: '4',
        title: 'Payment',
        icon: 'payment',
        color: AppColors.primaryYellow,
      ),
      ServiceItem(
        id: '5',
        title: 'Scan',
        icon: 'qr_code_scanner',
        color: AppColors.primaryGreen,
      ),
      ServiceItem(
        id: '6',
        title: 'Rewards',
        icon: 'card_giftcard',
        color: AppColors.primaryOrange,
      ),
      ServiceItem(
        id: '7',
        title: 'Store',
        icon: 'store',
        color: AppColors.primaryRed,
      ),
      ServiceItem(
        id: '8',
        title: 'More',
        icon: 'more_horiz',
        color: AppColors.mediumGray,
      ),
    ];
  }
}
