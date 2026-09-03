import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app/navigation/app_routes.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/constants/app_presentation_texts.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';

class AppSideMenu extends StatelessWidget {
  const AppSideMenu({super.key});

  static const _items = [
    (label: AppPresentationTexts.home, route: AppRoutes.home),
    (label: AppPresentationTexts.works, route: AppRoutes.works),
    (label: AppPresentationTexts.services, route: AppRoutes.services),
    (label: AppPresentationTexts.aboutMe, route: AppRoutes.aboutMe),
  ];

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    return Drawer(
      width: _drawerWidth(context),
      backgroundColor: AppColors.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(28.w, 8.h, 16.w, 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Scaffold.of(context).closeEndDrawer(),
                  icon: const Icon(Icons.close),
                ),
              ),
              SizedBox(height: 32.h),
              for (final item in _items)
                _SideMenuItem(
                  label: item.label,
                  route: item.route,
                  isActive: currentRoute == item.route,
                ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Scaffold.of(context).closeEndDrawer(),
                child: Text(
                  AppPresentationTexts.letsTalk,
                  style: AppTextStyles.button(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _drawerWidth(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (context.isTablet) {
      return 400.w;
    }

    return 200.w.clamp(200, screenWidth * 0.8).toDouble();
  }
}

class _SideMenuItem extends StatelessWidget {
  const _SideMenuItem({
    required this.label,
    required this.route,
    required this.isActive,
  });

  final String label;
  final String route;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () {
          Scaffold.of(context).closeEndDrawer();
          context.go(route);
        },
        borderRadius: BorderRadius.circular(8),
        hoverColor: AppColors.overlay,
        splashColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.headingSmall(context).copyWith(
                    color: isActive ? AppColors.primary : AppColors.textPrimary,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
              if (isActive)
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                  size: 18,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
