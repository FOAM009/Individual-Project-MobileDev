import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../models/promotion.dart';

class PromotionSection extends StatelessWidget {
  final List<Promotion> promotions;
  final int crossAxisCount;
  final Function(Promotion)? onPromotionTap;

  const PromotionSection({
    super.key,
    required this.promotions,
    this.crossAxisCount = 1,
    this.onPromotionTap,
  });

  @override
  Widget build(BuildContext context) {
    if (promotions.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.paddingMedium,
        vertical: AppTheme.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promotions',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppTheme.paddingMedium),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 2.0,
              crossAxisSpacing: AppTheme.paddingMedium,
              mainAxisSpacing: AppTheme.paddingMedium,
            ),
            itemCount: promotions.length,
            itemBuilder: (context, index) {
              final promotion = promotions[index];
              return _PromotionCard(
                promotion: promotion,
                onTap: () => onPromotionTap?.call(promotion),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PromotionCard extends StatelessWidget {
  final Promotion promotion;
  final VoidCallback onTap;

  const _PromotionCard({
    required this.promotion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: promotion.backgroundColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: AppTheme.shadowLight,
        ),
        child: Stack(
          children: [
            if (promotion.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                child: Image.asset(
                  promotion.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: promotion.backgroundColor,
                    );
                  },
                ),
              )
            else
              Container(
                width: double.infinity,
                height: double.infinity,
                color: promotion.backgroundColor,
              ),
            Container(
              padding: const EdgeInsets.all(AppTheme.paddingMedium),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    promotion.backgroundColor.withOpacity(0.7),
                    promotion.backgroundColor,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promotion.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: promotion.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppTheme.paddingXSmall),
                  Text(
                    promotion.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: promotion.textColor.withOpacity(0.9),
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
