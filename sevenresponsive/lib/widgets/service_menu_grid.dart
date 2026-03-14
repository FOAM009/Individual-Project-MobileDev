import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../models/service_item.dart';

class ServiceMenuGrid extends StatelessWidget {
  final List<ServiceItem> services;
  final int crossAxisCount;
  final double aspectRatio;
  final Function(ServiceItem)? onServiceTap;

  const ServiceMenuGrid({
    super.key,
    required this.services,
    this.crossAxisCount = 4,
    this.aspectRatio = 1.0,
    this.onServiceTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.paddingMedium,
        vertical: AppTheme.paddingSmall,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: AppTheme.paddingMedium,
          mainAxisSpacing: AppTheme.paddingMedium,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return _ServiceButton(
            service: service,
            onTap: () => onServiceTap?.call(service),
          );
        },
      ),
    );
  }
}

class _ServiceButton extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback onTap;

  const _ServiceButton({
    required this.service,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: service.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
            child: Icon(
              _getIconData(service.icon),
              color: service.color,
              size: 28,
            ),
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          Text(
            service.title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGray,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'delivery_dining':
        return Icons.delivery_dining;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'local_offer':
        return Icons.local_offer;
      case 'payment':
        return Icons.payment;
      case 'qr_code_scanner':
        return Icons.qr_code_scanner;
      case 'card_giftcard':
        return Icons.card_giftcard;
      case 'store':
        return Icons.store;
      case 'more_horiz':
        return Icons.more_horiz;
      default:
        return Icons.apps;
    }
  }
}
