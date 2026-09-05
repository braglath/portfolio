import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/constants/app_presentation_texts.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(AppPresentationTexts.b, style: AppTextStyles.displaySmall(context)),
      Container(color: AppColors.primary, width: 8, height: 8),
    ],
  );
}
