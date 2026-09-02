import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app/navigation/app_routes.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/utils/logger_utils.dart';

class HorizontalAppBar extends StatelessWidget {
  const HorizontalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    log.info("HorizontalAppBar currentRoute: $currentRoute");

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("B", style: AppTextStyles.displaySmall(context)),
              Container(color: AppColors.textPrimary, width: 8, height: 8),
            ],
          ),
          const Spacer(),
          // Navigation
          Row(
            children: [
              _NavItem(
                isActive: currentRoute == AppRoutes.home,
                label: 'Home',
                onTap: () {},
              ),
              _NavItem(isActive: false, label: 'Works', onTap: () {}),
              _NavItem(isActive: false, label: 'Services', onTap: () {}),
              _NavItem(isActive: false, label: 'About me', onTap: () {}),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text("Let's Talk", style: AppTextStyles.button(context)),
          ),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
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
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: isActive ? AppColors.primary : Colors.transparent,
            ),
            width: 32.w,
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
