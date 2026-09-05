import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_asset_path.dart';
import 'package:portfolio/core/constants/app_presentation_texts.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/shared/widgets/drop_shadow.dart';
import 'package:portfolio/shared/widgets/hover_tap_message.dart';

class HeroImage extends StatelessWidget {
  final BoxFit? fit;
  const HeroImage({super.key, this.fit = BoxFit.contain});

  static const _messages = [
AppPresentationTexts.heroMessage1,
AppPresentationTexts.heroMessage2,
AppPresentationTexts.heroMessage3,
AppPresentationTexts.heroMessage4,
AppPresentationTexts.heroMessage5,
AppPresentationTexts.heroMessage6,
AppPresentationTexts.heroMessage7,
AppPresentationTexts.heroMessage8,
AppPresentationTexts.heroMessage9,
AppPresentationTexts.heroMessage10,
AppPresentationTexts.heroMessage11,
AppPresentationTexts.heroMessage12,
AppPresentationTexts.heroMessage13,
AppPresentationTexts.heroMessage14,
  ];

  @override
  Widget build(BuildContext context) => HoverTapMessage(
    messages: _messages,
    bubbleTop: context.isMobile ? 150 : 5,
    bubbleRight: context.isMobile ? 100 : 5,
    child: DropShadow(
      child: Image.asset(AppAssetPath.braglath, width: 500.h, fit: fit),
    ),
  );
}
