import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../models/service_item.dart';
import '../models/product.dart';
import '../models/promotion.dart';
import '../models/coupon.dart';
import '../models/member_benefit.dart';
import '../models/campaign.dart';
import '../widgets/header_banner.dart';
import '../widgets/service_menu_grid.dart';
import '../widgets/promotion_section.dart';
import '../widgets/member_section.dart';
import '../widgets/product_card.dart';
import '../widgets/coupon_card.dart';
import '../widgets/campaign_banner.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/sidebar_navigation.dart';

/// Home Screen - Main responsive layout
/// Mobile: < 600px, Tablet: 600-1024px, Desktop: >= 1024px
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State
  int _currentIndex = 0;

  // Responsive Breakpoints
  bool get isMobile => MediaQuery.of(context).size.width < 600;
  bool get isTablet =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;
  bool get isDesktop => MediaQuery.of(context).size.width >= 1024;

  // Grid Columns
  int get serviceColumns => isMobile ? 4 : (isTablet ? 6 : 8);
  int get promotionColumns => isMobile ? 1 : (isTablet ? 2 : 3);
  int get productColumns => isMobile ? 2 : (isTablet ? 2 : 3);
  int get memberColumns => isMobile ? 1 : 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: isDesktop ? _buildDesktopLayout() : _buildMobileTabletLayout(),
      ),
      bottomNavigationBar: isDesktop ? null : _buildBottomNavigation(),
    );
  }

  // Layout Builders
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: SidebarNavigation(
            currentIndex: _currentIndex,
            onTap: _handleNavigationTap,
            leading: Padding(
              padding: const EdgeInsets.all(AppTheme.paddingMedium),
              child: _buildLogo(),
            ),
          ),
        ),
        Expanded(child: _buildMainContent()),
      ],
    );
  }

  Widget _buildMobileTabletLayout() {
    return _buildMainContent();
  }

  Widget _buildBottomNavigation() {
    return AppBottomNavigation(
      currentIndex: _currentIndex,
      onTap: _handleNavigationTap,
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppTheme.paddingSmall),
          _buildHeaderBanner(),
          _buildServiceGrid(),
          _buildPromotionSection(),
          _buildMemberSection(),
          _buildProductSection(),
          _buildCouponSection(),
          _buildCampaignSection(),
          const SizedBox(height: AppTheme.paddingXLarge),
          if (!isDesktop)
            SizedBox(height: MediaQuery.of(context).padding.bottom + 80),
        ],
      ),
    );
  }

  // Component Builders
  Widget _buildLogo() {
    return Image.asset(
      'assets/images/Sevenlogo.png',
      width: 40,
      height: 40,
      errorBuilder: (context, error, stackTrace) => Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.primaryGreen,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.store, color: AppColors.white, size: 24),
      ),
    );
  }

  Widget _buildHeaderBanner() {
    return HeaderBanner(
      title: 'Welcome to 7-Eleven',
      subtitle: 'Your convenience store, anytime, anywhere',
      imageUrl: 'assets/images/banner_welcome.png',
      backgroundColor: AppColors.primaryGreen,
      onTap: () {},
    );
  }

  Widget _buildServiceGrid() {
    return Padding(
      padding: const EdgeInsets.only(top: AppTheme.paddingMedium),
      child: ServiceMenuGrid(
        services: ServiceItemData.getServices(),
        crossAxisCount: serviceColumns,
        aspectRatio: isTablet ? 1.2 : 1.0,
        onServiceTap: (service) => _showServiceDialog(service),
      ),
    );
  }

  Widget _buildPromotionSection() {
    return PromotionSection(
      promotions: PromotionData.getPromotions(),
      crossAxisCount: promotionColumns,
      onPromotionTap: (promotion) => _showPromotionDialog(promotion),
    );
  }

  Widget _buildMemberSection() {
    return MemberSection(
      benefits: MemberBenefitData.getBenefits(),
      crossAxisCount: memberColumns,
      onBenefitTap: (benefit) => _showBenefitDialog(benefit),
    );
  }

  Widget _buildProductSection() {
    return ProductSection(
      products: ProductData.getFeaturedProducts(),
      title: 'Featured Products',
      crossAxisCount: productColumns,
      onProductTap: (product) => _showProductDialog(product),
      onFavoriteToggle: (product) => _handleFavoriteToggle(product),
    );
  }

  Widget _buildCouponSection() {
    return CouponSection(
      coupons: CouponData.getCoupons(),
      onCouponTap: (coupon) => _showCouponDialog(coupon),
    );
  }

  Widget _buildCampaignSection() {
    return CampaignSection(
      campaigns: CampaignData.getCampaigns(),
      onCampaignTap: (campaign) => _showCampaignDialog(campaign),
    );
  }

  // Event Handlers
  void _handleNavigationTap(int index) {
    setState(() => _currentIndex = index);
  }

  // Dialog Handlers
  void _showServiceDialog(ServiceItem service) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(service.title),
        content: Text('Opening ${service.title}...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showPromotionDialog(Promotion promotion) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(promotion.title),
        content: Text(promotion.description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Claim Now'),
          ),
        ],
      ),
    );
  }

  void _showBenefitDialog(MemberBenefit benefit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(benefit.title),
        content: Text(benefit.description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          if (benefit.actionText != null)
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(benefit.actionText!),
            ),
        ],
      ),
    );
  }

  void _showProductDialog(Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              child: Image.asset(
                product.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: AppColors.lightGray,
                    child: const Icon(Icons.image, size: 64, color: AppColors.mediumGray),
                  );
                },
              ),
            ),
            const SizedBox(height: AppTheme.paddingMedium),
            Text(product.description),
            const SizedBox(height: AppTheme.paddingSmall),
            Row(
              children: [
                Text(
                  '฿${product.price.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primaryRed,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (product.originalPrice != null && product.originalPrice! > product.price)
                  Padding(
                    padding: const EdgeInsets.only(left: AppTheme.paddingSmall),
                    child: Text(
                      '฿${product.originalPrice!.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.mediumGray,
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }

  void _showCouponDialog(Coupon coupon) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(coupon.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.paddingMedium),
              decoration: BoxDecoration(
                color: coupon.color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                border: Border.all(color: coupon.color, width: 2),
              ),
              child: Center(
                child: Text(
                  coupon.discountText,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: coupon.color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.paddingMedium),
            Text(coupon.description),
            const SizedBox(height: AppTheme.paddingSmall),
            Row(
              children: [
                const Icon(Icons.code, size: 16),
                const SizedBox(width: AppTheme.paddingXSmall),
                Text(
                  'Code: ${coupon.code}',
                  style: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.5),
                ),
              ],
            ),
            if (coupon.expiryDate != null)
              Padding(
                padding: const EdgeInsets.only(top: AppTheme.paddingXSmall),
                child: Text(
                  'Expires: ${coupon.expiryDate!.day}/${coupon.expiryDate!.month}/${coupon.expiryDate!.year}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () => _copyCouponCode(coupon),
            style: ElevatedButton.styleFrom(
              backgroundColor: coupon.color,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Copy Code'),
          ),
        ],
      ),
    );
  }

  void _showCampaignDialog(Campaign campaign) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(campaign.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              child: Image.asset(
                campaign.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [campaign.gradientStart, campaign.gradientEnd],
                      ),
                      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppTheme.paddingMedium),
            Text(campaign.description),
            const SizedBox(height: AppTheme.paddingSmall),
            Text(
              '${campaign.subtitle}\nValid: ${campaign.startDate.day}/${campaign.startDate.month} - ${campaign.endDate.day}/${campaign.endDate.month}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: campaign.gradientStart,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Learn More'),
          ),
        ],
      ),
    );
  }

  void _copyCouponCode(Coupon coupon) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Coupon code ${coupon.code} copied!'),
        backgroundColor: AppColors.primaryGreen,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleFavoriteToggle(Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(product.isFavorite ? 'Removed from favorites' : 'Added to favorites'),
        backgroundColor: AppColors.primaryGreen,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
