import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';

class HeroName extends StatelessWidget {
  const HeroName({super.key});

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      // Offset outline
      Text(
        'Braglath',
        style: context.isMobile
            ? AppTextStyles.displayLarge(context).copyWith(
                letterSpacing: 5,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3.0
                  ..color = AppColors.border,
              )
            : AppTextStyles.displayMedium(context).copyWith(
                letterSpacing: 5,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3.0
                  ..color = AppColors.border,
              ),
      ),
      // Main text
      Text(
        'Braglath',
        style: context.isMobile
            ? AppTextStyles.displayLarge(
                context,
              ).copyWith(letterSpacing: 4, color: AppColors.textPrimary)
            : AppTextStyles.displayMedium(
                context,
              ).copyWith(letterSpacing: 4, color: AppColors.textPrimary),
      ),
    ],
  );
}
