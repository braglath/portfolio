import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/shared/widgets/appbar/app_side_menu.dart';
import 'package:portfolio/shared/widgets/appbar/horizontal_app_bar.dart';
import 'package:portfolio/shared/widgets/appbar/vertical_app_bar.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppSideMenu(),
      endDrawerEnableOpenDragGesture: !context.isDesktop,
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              reverseDuration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: context.isMobile
                  ? const VerticalAppBar(key: ValueKey('vertical-app-bar'))
                  : const HorizontalAppBar(key: ValueKey('horizontal-app-bar')),
            ),
          ),

          Expanded(child: child),
        ],
      ),
    );
  }
}
