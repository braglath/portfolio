import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveDebug extends StatelessWidget {
  const ResponsiveDebug({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final breakpoint = ResponsiveBreakpoints.of(context);

    return Positioned(
      left: 16,
      bottom: 16,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Width: ${size.width.toStringAsFixed(0)}\n'
            'Height: ${size.height.toStringAsFixed(0)}\n'
            'Breakpoint: ${breakpoint.breakpoint.name}\n'
            'Mobile: ${breakpoint.isMobile}\n'
            'Tablet: ${breakpoint.isTablet}\n'
            'Desktop: ${breakpoint.isDesktop}',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
