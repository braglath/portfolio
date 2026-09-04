import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app/navigation/app_routes.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/utils/logger_utils.dart';
import 'package:portfolio/shared/widgets/appbar/lets_talk_button.dart';
import 'package:portfolio/shared/widgets/appbar/logo_text.dart';

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
          LogoText(),
          const Spacer(),
          // Navigation
          Row(
            children: [
              _NavItem(
                isActive: currentRoute == AppRoutes.home,
                label: 'Home',
                onTap: () => context.go(AppRoutes.home),
              ),
              _NavItem(
                isActive: currentRoute == AppRoutes.works,
                label: 'Works',
                onTap: () => context.go(AppRoutes.works),
              ),
              _NavItem(
                isActive: currentRoute == AppRoutes.services,
                label: 'Services',
                onTap: () => context.go(AppRoutes.services),
              ),
              _NavItem(
                isActive: currentRoute == AppRoutes.aboutMe,
                label: 'About me',
                onTap: () => context.go(AppRoutes.aboutMe),
              ),
            ],
          ),
          const Spacer(),
          LetsTalkButton(),
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
