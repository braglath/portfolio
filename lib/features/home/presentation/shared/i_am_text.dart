import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';

class IAmText extends StatelessWidget {
  const IAmText({super.key});

  @override
  Widget build(BuildContext context) =>
      Text("Hello, I'm", style: AppTextStyles.displaySmall(context));
}
