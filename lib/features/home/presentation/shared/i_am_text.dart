import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/constants/app_presentation_texts.dart';

class IAmText extends StatelessWidget {
  const IAmText({super.key});

  @override
  Widget build(BuildContext context) => Text(
    "${AppPresentationTexts.hello}, ${AppPresentationTexts.im}",
    style: AppTextStyles.displaySmall(context),
  );
}
