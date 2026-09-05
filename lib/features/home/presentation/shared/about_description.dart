import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/constants/app_presentation_texts.dart';

class AboutDescription extends StatelessWidget {
  const AboutDescription({super.key});

  @override
  Widget build(BuildContext context) => Text(
    AppPresentationTexts.heroShortAboutMe,
    style: AppTextStyles.bodyLarge(
      context,
    ).copyWith(fontWeight: FontWeight.bold),
    textAlign: TextAlign.left,
  );
}
