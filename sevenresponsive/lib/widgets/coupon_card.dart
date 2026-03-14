import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../models/coupon.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;
  final Function(Coupon)? onCouponTap;

  const CouponCard({
    super.key,
    required this.coupon,
    this.onCouponTap,
  });

  @override
  Widget build(BuildContext context) {
    final isExpired = coupon.isExpired;
    final isUsed = coupon.isUsed;

    return GestureDetector(
      onTap: isExpired || isUsed ? null : () => onCouponTap?.call(coupon),
      child: Container(
        margin: const EdgeInsets.only(
          right: AppTheme.paddingMedium,
          bottom: AppTheme.paddingSmall,
        ),
        width: 280,
        decoration: BoxDecoration(
          color: isExpired || isUsed ? AppColors.lightGray : coupon.color,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: AppTheme.shadowLight,
        ),
        child: Stack(
          children: [
            Positioned(
              left: -10,
              top: 0,
              bottom: 0,
              child: Container(
                width: 20,
                decoration: BoxDecoration(
                  color: isExpired || isUsed
                      ? AppColors.lightGray
                      : AppColors.offWhite,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -10,
              top: 0,
              bottom: 0,
              child: Container(
                width: 20,
                decoration: BoxDecoration(
                  color: isExpired || isUsed
                      ? AppColors.lightGray
                      : AppColors.offWhite,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppTheme.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.paddingSmall,
                          vertical: AppTheme.paddingXSmall,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusSmall,
                          ),
                        ),
                        child: Text(
                          coupon.discountText,
                          style: const TextStyle(
                            color: AppColors.darkGray,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (isExpired)
                        const Icon(
                          Icons.cancel,
                          color: AppColors.mediumGray,
                          size: 20,
                        )
                      else if (isUsed)
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.success,
                          size: 20,
                        )
                      else
                        const Icon(
                          Icons.local_offer,
                          color: AppColors.white,
                          size: 20,
                        ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.paddingMedium),
                  Text(
                    coupon.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: isExpired || isUsed
                              ? AppColors.mediumGray
                              : AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppTheme.paddingXSmall),
                  Text(
                    coupon.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isExpired || isUsed
                              ? AppColors.mediumGray
                              : AppColors.white.withOpacity(0.9),
                        ),
                  ),
                  const SizedBox(height: AppTheme.paddingSmall),
                  Row(
                    children: [
                      const Icon(
                        Icons.code,
                        size: 14,
                        color: AppColors.white,
                      ),
                      const SizedBox(width: AppTheme.paddingXSmall),
                      Text(
                        coupon.code,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const Spacer(),
                      if (coupon.expiryDate != null)
                        Text(
                          _formatExpiry(coupon.expiryDate!),
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 10,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatExpiry(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now);
    if (difference.inDays == 0) {
      return 'Expires today';
    } else if (difference.inDays == 1) {
      return 'Expires tomorrow';
    } else if (difference.inDays < 7) {
      return 'Expires in ${difference.inDays} days';
    } else {
      return 'Exp: ${date.day}/${date.month}';
    }
  }
}

class CouponSection extends StatelessWidget {
  final List<Coupon> coupons;
  final Function(Coupon)? onCouponTap;

  const CouponSection({
    super.key,
    required this.coupons,
    this.onCouponTap,
  });

  @override
  Widget build(BuildContext context) {
    if (coupons.isEmpty) return const SizedBox.shrink();

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
                'My Coupons',
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
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coupons.length,
              itemBuilder: (context, index) {
                final coupon = coupons[index];
                return CouponCard(
                  coupon: coupon,
                  onCouponTap: onCouponTap,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
