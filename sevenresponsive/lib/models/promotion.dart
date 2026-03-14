import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class Promotion {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final Color backgroundColor;
  final Color textColor;
  final bool isActive;

  Promotion({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.backgroundColor,
    required this.textColor,
    this.isActive = true,
  });
}

class PromotionData {
  static List<Promotion> getPromotions() {
    return [
      Promotion(
        id: '1',
        title: 'Happy Hour',
        description: 'Get 50% off on all drinks',
        imageUrl: 'assets/images/promo_happyhour.jpg',
        backgroundColor: AppColors.primaryRed,
        textColor: AppColors.white,
      ),
      Promotion(
        id: '2',
        title: 'Member Special',
        description: 'Exclusive deals for members',
        imageUrl: 'assets/images/promo_member.jpg',
        backgroundColor: AppColors.primaryGreen,
        textColor: AppColors.white,
      ),
      Promotion(
        id: '3',
        title: 'Weekend Sale',
        description: 'Up to 70% off selected items',
        imageUrl: 'assets/images/promo_weekend.jpg',
        backgroundColor: AppColors.primaryYellow,
        textColor: AppColors.black,
      ),
    ];
  }
}
