import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../models/member_benefit.dart';

class MemberSection extends StatelessWidget {
  final List<MemberBenefit> benefits;
  final int crossAxisCount;
  final Function(MemberBenefit)? onBenefitTap;

  const MemberSection({
    super.key,
    required this.benefits,
    this.crossAxisCount = 1,
    this.onBenefitTap,
  });

  @override
  Widget build(BuildContext context) {
    if (benefits.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.paddingMedium,
        vertical: AppTheme.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Member Benefits',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.paddingMedium),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 2.5,
              crossAxisSpacing: AppTheme.paddingMedium,
              mainAxisSpacing: AppTheme.paddingMedium,
            ),
            itemCount: benefits.length,
            itemBuilder: (context, index) {
              final benefit = benefits[index];
              return _MemberBenefitCard(
                benefit: benefit,
                onTap: () => onBenefitTap?.call(benefit),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MemberBenefitCard extends StatelessWidget {
  final MemberBenefit benefit;
  final VoidCallback onTap;

  const _MemberBenefitCard({
    required this.benefit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppTheme.paddingMedium),
        decoration: BoxDecoration(
          color: benefit.backgroundColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          border: Border.all(
            color: AppColors.lightGray,
            width: 1,
          ),
          boxShadow: AppTheme.shadowLight,
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: benefit.iconColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
              ),
              child: Icon(
                benefit.icon,
                color: benefit.iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: AppTheme.paddingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    benefit.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: AppTheme.paddingXSmall),
                  Text(
                    benefit.description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (benefit.actionText != null)
              Icon(
                Icons.chevron_right,
                color: AppColors.mediumGray,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
