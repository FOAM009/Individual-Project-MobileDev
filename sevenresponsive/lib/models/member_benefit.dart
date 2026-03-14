import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class MemberBenefit {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String? actionText;

  MemberBenefit({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    this.actionText,
  });
}

class MemberBenefitData {
  static List<MemberBenefit> getBenefits() {
    return [
      MemberBenefit(
        id: '1',
        title: 'Collect Points',
        description: 'Earn 1 point for every ฿10 spent',
        icon: Icons.stars,
        iconColor: AppColors.primaryYellow,
        backgroundColor: AppColors.white,
        actionText: 'Learn More',
      ),
      MemberBenefit(
        id: '2',
        title: 'Member Discounts',
        description: 'Exclusive member-only prices',
        icon: Icons.discount,
        iconColor: AppColors.primaryRed,
        backgroundColor: AppColors.white,
        actionText: 'View Deals',
      ),
      MemberBenefit(
        id: '3',
        title: 'Birthday Treat',
        description: 'Free special gift on your birthday',
        icon: Icons.cake,
        iconColor: AppColors.primaryGreen,
        backgroundColor: AppColors.white,
        actionText: 'Claim Now',
      ),
    ];
  }
}
