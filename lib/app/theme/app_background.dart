import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/theme/app_colors.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Base background
        const ColoredBox(color: AppColors.background),

        // Large center circle
        Center(
          child: Container(
            width: 500,
            height: 500,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryLight,
            ),
          ),
        ),

        // Small top-left circle
        Positioned(top: 80.h, left: 80.w, child: _SmallCircle(size: 100)),

        // Small top-right circle
        Positioned(top: 160.h, right: 120.w, child: _SmallCircle(size: 70)),

        // Small bottom-right circle
        Positioned(bottom: 80.h, right: 180.w, child: _SmallCircle(size: 90)),
      ],
    );
  }
}

class _SmallCircle extends StatelessWidget {
  const _SmallCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryLight,
      ),
    );
  }
}
