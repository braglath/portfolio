import 'package:flutter/material.dart';

class RouteTracker extends NavigatorObserver {
  String? previousRoute;
  String? currentRoute;

  @override
  void didPush(Route route, Route? previousRoute) {
    this.previousRoute = previousRoute?.settings.name;
    currentRoute = route.settings.name;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    previousRoute = oldRoute?.settings.name;
    currentRoute = newRoute?.settings.name;
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    this.previousRoute = route.settings.name;
    currentRoute = previousRoute?.settings.name;
  }
}

final routeTracker = RouteTracker();
