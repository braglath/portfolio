import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app/navigation/app_routes.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';

class NavItems extends StatelessWidget {
  final String currentRoute;
  final MainAxisAlignment mainAxisAlignment;
  const NavItems(
    this.currentRoute, {
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      NavItemModel(
        isActive: currentRoute == AppRoutes.home,
        label: 'Home',
        onTap: () => context.go(AppRoutes.home),
      ),
      NavItemModel(
        isActive: currentRoute == AppRoutes.works,
        label: 'Works',
        onTap: () => context.go(AppRoutes.works),
      ),
      NavItemModel(
        isActive: currentRoute == AppRoutes.services,
        label: 'Services',
        onTap: () => context.go(AppRoutes.services),
      ),
      NavItemModel(
        isActive: currentRoute == AppRoutes.aboutMe,
        label: 'About me',
        onTap: () => context.go(AppRoutes.aboutMe),
      ),
    ],
  );
}

class NavItemModel extends StatelessWidget {
  const NavItemModel({
    super.key,
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  final String label;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        children: [
          TextButton(
            onPressed: onTap,
            child: Text(
              label,
              style: AppTextStyles.bodyMedium(context).copyWith(
                color: isActive ? AppColors.primary : AppColors.textPrimary,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: isActive ? AppColors.primary : Colors.transparent,
            ),
            width: isActive ? 32.w : 0,
            height: isActive ? 2.h : 0,
          ),
        ],
      ),
    );
  }
}
