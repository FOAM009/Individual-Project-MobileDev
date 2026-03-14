import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class Campaign {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final Color gradientStart;
  final Color gradientEnd;
  final DateTime startDate;
  final DateTime endDate;

  Campaign({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.gradientStart,
    required this.gradientEnd,
    required this.startDate,
    required this.endDate,
  });

  bool get isActive {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }
}

class CampaignData {
  static List<Campaign> getCampaigns() {
    final now = DateTime.now();
    return [
      Campaign(
        id: '1',
        title: 'Summer Festival',
        subtitle: 'Limited Time Offer',
        description: 'Enjoy special summer deals all season long',
        imageUrl: 'assets/images/campaign_summer.jpg',
        gradientStart: const Color(0xFFFF6B6B),
        gradientEnd: const Color(0xFFFF8E53),
        startDate: now.subtract(const Duration(days: 15)),
        endDate: now.add(const Duration(days: 45)),
      ),
      Campaign(
        id: '2',
        title: 'Health & Wellness',
        subtitle: 'New Arrivals',
        description: 'Discover our new healthy options',
        imageUrl: 'assets/images/campaign_health.jpg',
        gradientStart: const Color(0xFF4ECDC4),
        gradientEnd: const Color(0xFF44A08D),
        startDate: now.subtract(const Duration(days: 7)),
        endDate: now.add(const Duration(days: 60)),
      ),
    ];
  }
}
