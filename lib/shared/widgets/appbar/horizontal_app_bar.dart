import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/utils/logger_utils.dart';
import 'package:portfolio/shared/widgets/appbar/lets_talk_button.dart';
import 'package:portfolio/shared/widgets/appbar/logo_text.dart';
import 'package:portfolio/shared/widgets/appbar/nav_items.dart';

class HorizontalAppBar extends StatelessWidget {
  const HorizontalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    log.info("HorizontalAppBar currentRoute: $currentRoute");

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoText(),
          const Spacer(),
          NavItems(currentRoute),
          const Spacer(),
          LetsTalkButton(),
        ],
      ),
    );
  }
}
