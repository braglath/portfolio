import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app/navigation/app_routes.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/constants/app_presentation_texts.dart';
import 'package:portfolio/core/utils/logger_utils.dart';
import 'package:portfolio/shared/widgets/appbar/logo_text.dart';

class VerticalAppBar extends StatelessWidget {
  const VerticalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    log.info('VerticalAppBar currentRoute: $currentRoute');

    final label = _getCurrentLabel(currentRoute);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        children: [
          const LogoText(),
          const Spacer(),
          Text(
            label,
            style: AppTextStyles.bodyMedium(
              context,
            ).copyWith(color: AppColors.primary, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(Icons.menu),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getCurrentLabel(String route) {
    switch (route) {
      case AppRoutes.home:
        return AppPresentationTexts.home;
      case AppRoutes.works:
        return AppPresentationTexts.works;
      case AppRoutes.services:
        return AppPresentationTexts.services;
      case AppRoutes.aboutMe:
        return AppPresentationTexts.aboutMe;
      default:
        return '';
    }
  }
}
