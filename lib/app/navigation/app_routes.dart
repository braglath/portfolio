// app_router.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app/app.dart';
import 'package:portfolio/app/navigation/route_tracker.dart';
import 'package:portfolio/core/utils/logger_utils.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.home,
    observers: [routeTracker],
    redirect: (context, state) {
      final loc = state.uri.toString();
      log.info("router loc: $loc");

      // return AppRoutes.home; // hardcoded navigation for testing

      return null;
    },
    routes: [
      GoRoute(
        name: 'home',
        path: AppRoutes.home,
        builder: (_, _) => const HomeScreen(),
      ),
    ],
  );
});

class AppRoutes {
  AppRoutes._();
  static const splash = '/splash';
  static const home = '/home';
}
