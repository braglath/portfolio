import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/features/home/presentation/home_screen_desktop_tablet.dart';
import 'package:portfolio/features/home/presentation/home_screen_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      context.isMobile ? HomeScreenMobile() : HomeScreenDesktopAndTablet();
}
