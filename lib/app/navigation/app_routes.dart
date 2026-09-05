// app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app/navigation/app_shell.dart';
import 'package:portfolio/app/navigation/route_tracker.dart';
import 'package:portfolio/app/theme/app_page_transition.dart';
import 'package:portfolio/core/utils/logger_utils.dart';
import 'package:portfolio/features/home/presentation/home_screen.dart';

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
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            name: '/',
            path: AppRoutes.home,
            pageBuilder: (_, state) {
              return AppPageTransition.fadeSlideFromTop(
                key: state.pageKey,
                child: const HomeScreen(),
              );
            },
          ),
          GoRoute(
            name: 'home',
            path: AppRoutes.home,
            pageBuilder: (_, state) {
              return AppPageTransition.fadeSlideFromTop(
                key: state.pageKey,
                child: const HomeScreen(),
              );
            },
          ),
          GoRoute(
            name: 'works',
            path: AppRoutes.works,
            pageBuilder: (_, state) {
              return AppPageTransition.fadeSlideFromTop(
                key: state.pageKey,
                child: Container(color: Colors.red),
              );
            },
          ),
          GoRoute(
            name: 'services',
            path: AppRoutes.services,
            pageBuilder: (_, state) {
              return AppPageTransition.fadeSlideFromTop(
                key: state.pageKey,
                child: Container(color: Colors.green),
              );
            },
          ),
          GoRoute(
            name: 'aboutMe',
            path: AppRoutes.aboutMe,
            builder: (_, _) =>
                Container(color: Colors.blue), // Placeholder for AboutMeScreen
          ),
        ],
      ),
    ],
  );
});

class AppRoutes {
  AppRoutes._();
  static const splash = '/splash';
  static const home = '/home';
  static const works = '/works';
  static const services = '/services';
  static const aboutMe = '/aboutMe';
}
