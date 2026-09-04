import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/constants/app_presentation_texts.dart';

class LetsTalkButton extends StatelessWidget {
  const LetsTalkButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: () {},
    child: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.w,
      children: [
        Text(
          AppPresentationTexts.letsTalk,
          style: AppTextStyles.button(context),
        ),
        FaIcon(FontAwesomeIcons.comment, size: 18),
      ],
    ),
  );
}
