import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class SidebarNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Widget? leading;

  const SidebarNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      leading: leading,
      backgroundColor: AppColors.white,
      selectedIconTheme: const IconThemeData(color: AppColors.primaryGreen),
      unselectedIconTheme: const IconThemeData(color: AppColors.mediumGray),
      selectedLabelTextStyle: const TextStyle(
        color: AppColors.primaryGreen,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      unselectedLabelTextStyle: const TextStyle(
        color: AppColors.mediumGray,
        fontSize: 12,
      ),
      labelType: NavigationRailLabelType.all,
      elevation: 4,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore),
          label: Text('Explore'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.shopping_basket_outlined),
          selectedIcon: Icon(Icons.shopping_basket),
          label: Text('Cart'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.local_offer_outlined),
          selectedIcon: Icon(Icons.local_offer),
          label: Text('Deals'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: Text('Profile'),
        ),
      ],
    );
  }
}
