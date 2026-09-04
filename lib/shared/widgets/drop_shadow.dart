import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_colors.dart';

class DropShadow extends StatelessWidget {
  const DropShadow({
    super.key,
    required this.child,
    this.offset = const Offset(0, 18),
    this.blurSigma = 5,
    this.opacity = 0.22,
  });

  final Widget child;
  final Offset offset;
  final double blurSigma;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Shadow
        Transform.translate(
          offset: offset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                AppColors.textPrimary.withValues(alpha: opacity),
                BlendMode.srcIn,
              ),
              child: child,
            ),
          ),
        ),

        // Original widget
        child,
      ],
    );
  }
}
