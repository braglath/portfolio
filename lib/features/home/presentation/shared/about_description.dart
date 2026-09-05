import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';

class AboutDescription extends StatelessWidget {
  const AboutDescription({super.key});

  @override
  Widget build(BuildContext context) => Text(
      "A Flutter developer and Technical Lead with 8+ years of software development experience, passionate about turning ideas into scalable, high-performance digital products through clean architecture and thoughtful engineering.",
      style: AppTextStyles.bodyLarge(
        context,
      ).copyWith(fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    
  );
}
