import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class HeaderBanner extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const HeaderBanner({
    super.key,
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor = backgroundColor ?? AppColors.primaryGreen;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    // Responsive banner height
    final bannerHeight = isMobile ? 180.0 : (isTablet ? 220.0 : 280.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: AppTheme.paddingMedium,
          vertical: AppTheme.paddingSmall,
        ),
        padding: const EdgeInsets.all(AppTheme.paddingLarge),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              effectiveBackgroundColor,
              effectiveBackgroundColor.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          boxShadow: AppTheme.shadowMedium,
        ),
        child: imageUrl != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    child: Image.asset(
                      imageUrl!,
                      width: double.infinity,
                      height: bannerHeight,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: bannerHeight,
                          color: AppColors.lightGray,
                          child: const Icon(
                            Icons.image,
                            size: 64,
                            color: AppColors.mediumGray,
                          ),
                        );
                      },
                    ),
                  ),
                  if (title.isNotEmpty || subtitle != null) ...[
                    const SizedBox(height: AppTheme.paddingMedium),
                    Text(
                      title,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.white.withOpacity(0.9),
                        ),
                      ),
                  ],
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppTheme.paddingSmall),
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}
