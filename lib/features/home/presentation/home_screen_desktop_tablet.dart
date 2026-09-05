import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_asset_path.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/features/home/presentation/shared/about_description.dart';
import 'package:portfolio/features/home/presentation/shared/hero_image.dart';
import 'package:portfolio/features/home/presentation/shared/hero_name.dart';
import 'package:portfolio/features/home/presentation/shared/home_services.dart';
import 'package:portfolio/features/home/presentation/shared/i_am_text.dart';
import 'package:portfolio/shared/widgets/social_buttons.dart';

class HomeScreenDesktopAndTablet extends StatelessWidget {
  const HomeScreenDesktopAndTablet({super.key});

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.bottomCenter,
    children: [
      const _HeroImage(),
      Positioned.fill(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const _AboutText(),
                    SizedBox(height: 24.h),
                    const SocialButtonsRow(),
                  ],
                ),
              ),
              SizedBox(width: 48.w),
              if (context.isDesktop) ...[
                Expanded(child: _HeroSkillsDesktop()),
              ] else if (context.isTablet) ...[
                // if device widget is greater than 750px, then show the tablet widget
                if (MediaQuery.sizeOf(context).width > 750) ...[
                  Expanded(child: _HeroSkillsTabletColumn()),
                ],
              ],
            ],
          ),
        ),
      ),
    ],
  );
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      HeroNameWithIAm(),
      SizedBox(height: 16.h),
      Container(
        width: MediaQuery.sizeOf(context).width * 0.3,
        alignment: Alignment.centerLeft,
        child: AboutDescription(),
      ),
    ],
  );
}

class HeroNameWithIAm extends StatelessWidget {
  const HeroNameWithIAm({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [IAmText(), HeroName()],
  );
}

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  @override
  Widget build(BuildContext context) => Positioned(
    bottom: 0,
    right: (context.isTablet && MediaQuery.sizeOf(context).width < 750)
        ? 0.w
        : null,
    child: HeroImage(),
  );
}

class _HeroSkillsDesktop extends StatelessWidget {
  const _HeroSkillsDesktop();

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    children: [
      PositionedHomeServices(
        top: 0.h,
        left: 100.w,
        right: 100.w,
        bottom: 200.h,
        assetImagePath: AppAssetPath.crossPlatform,
        label: "Cross-Platform",
      ),

      PositionedHomeServices(
        top: 200.h,
        left: 400.w,
        bottom: 150.h,
        right: 0.w,
        assetImagePath: AppAssetPath.architecture,
        label: "Architecture",
      ),

      PositionedHomeServices(
        top: 425.h,
        left: 100.w,
        right: 50.w,
        bottom: 0.h,
        assetImagePath: AppAssetPath.optimization,
        label: "Optimization",
      ),
    ],
  );
}

class _HeroSkillsTabletColumn extends StatelessWidget {
  const _HeroSkillsTabletColumn();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: GetHome.services(),
    ),
  );
}

class PositionedHomeServices extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  final String assetImagePath;
  final String label;

  const PositionedHomeServices({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.assetImagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) => Positioned(
    top: top?.h,
    left: left?.w,
    right: right?.w,
    bottom: bottom?.h,
    child: HomeServices(assetImagePath: assetImagePath, label: label),
  );
}
