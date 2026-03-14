import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../models/campaign.dart';

class CampaignBanner extends StatelessWidget {
  final Campaign campaign;
  final Function(Campaign)? onCampaignTap;

  const CampaignBanner({
    super.key,
    required this.campaign,
    this.onCampaignTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCampaignTap?.call(campaign),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppTheme.paddingMedium,
          vertical: AppTheme.paddingSmall,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [campaign.gradientStart, campaign.gradientEnd],
          ),
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          boxShadow: AppTheme.shadowMedium,
        ),
        child: Stack(
          children: [
            if (campaign.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
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
                          colors: [
                            campaign.gradientStart,
                            campaign.gradientEnd
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [campaign.gradientStart, campaign.gradientEnd],
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                ),
              ),
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(AppTheme.paddingLarge),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.paddingMedium,
                      vertical: AppTheme.paddingXSmall,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        AppTheme.radiusSmall,
                      ),
                    ),
                    child: Text(
                      campaign.subtitle,
                      style: const TextStyle(
                        color: AppColors.darkGray,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.paddingSmall),
                  Text(
                    campaign.title,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppTheme.paddingXSmall),
                  Text(
                    campaign.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white.withOpacity(0.9),
                        ),
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

class CampaignSection extends StatelessWidget {
  final List<Campaign> campaigns;
  final Function(Campaign)? onCampaignTap;

  const CampaignSection({
    super.key,
    required this.campaigns,
    this.onCampaignTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeCampaigns = campaigns.where((c) => c.isActive).toList();

    if (activeCampaigns.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppTheme.paddingSmall,
      ),
      child: Column(
        children: activeCampaigns.map((campaign) {
          return CampaignBanner(
            campaign: campaign,
            onCampaignTap: onCampaignTap,
          );
        }).toList(),
      ),
    );
  }
}
