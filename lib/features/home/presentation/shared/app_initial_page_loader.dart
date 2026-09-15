import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:portfolio/features/home/presentation/shared/initial_page_loader.dart';

class AppInitialPageLoader extends StatefulWidget {
  final Widget child;

  const AppInitialPageLoader({super.key, required this.child});

  @override
  State<AppInitialPageLoader> createState() => _AppInitialPageLoaderState();
}

class _AppInitialPageLoaderState extends State<AppInitialPageLoader> {
  bool _isReady = false;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;

      setState(() {
        _isReady = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return const InitialPageLoader();
    }

    return widget.child;
  }
}
