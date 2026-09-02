import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/navigation/app_routes.dart';
import 'package:portfolio/app/theme/app_theme.dart';
import 'package:portfolio/shared/widgets/global_loader.dart';
import 'package:portfolio/shared/widgets/responsive_debug.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: router,
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              breakpoints: [
                const Breakpoint(start: 0, end: 599, name: MOBILE),
                const Breakpoint(start: 600, end: 1023, name: TABLET),
                const Breakpoint(
                  start: 1024,
                  end: double.infinity,
                  name: DESKTOP,
                ),
              ],
              child: Stack(
                children: [
                  child!,
                  const GlobalLoader(),
                  if (kDebugMode) const ResponsiveDebug(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
