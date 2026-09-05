import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/constants/app_asset_path.dart';
import 'package:portfolio/core/constants/app_presentation_texts.dart';

class GetHome {
  GetHome._();
  static List<HomeServices> services({double? size}) => [
    HomeServices(
      assetImagePath: AppAssetPath.crossPlatform,
      label: AppPresentationTexts.crossPlatform,
      size: size,
    ),

    HomeServices(
      assetImagePath: AppAssetPath.architecture,
      label: AppPresentationTexts.architecture,
      size: size,
    ),

    HomeServices(
      assetImagePath: AppAssetPath.optimization,
      label: AppPresentationTexts.optimization  ,
      size: size,
    ),
  ];
}

class HomeServices extends StatelessWidget {
  final String assetImagePath;
  final String label;
  final double? size;

  const HomeServices({
    super.key,
    required this.assetImagePath,
    required this.label,
    this.size,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Image.asset(
        assetImagePath,
        width: size == null || size == 0 ? 200.w : size!.w,
        height: size == null || size == 0 ? 200.w : size!.w,
        fit: BoxFit.contain,
      ),
      Container(
        margin: EdgeInsets.only(top: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodyLarge(
            context,
          ).copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
      ),
    ],
  );
}
