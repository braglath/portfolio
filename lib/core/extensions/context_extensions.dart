import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveContextExtension on BuildContext {
  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;

  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;

  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;

  bool get isPhone => ResponsiveBreakpoints.of(this).isPhone;

  bool breakpointEquals(String breakpoint) =>
      ResponsiveBreakpoints.of(this).equals(breakpoint);

  bool breakpointLargerThan(String breakpoint) =>
      ResponsiveBreakpoints.of(this).largerThan(breakpoint);

  bool breakpointSmallerThan(String breakpoint) =>
      ResponsiveBreakpoints.of(this).smallerThan(breakpoint);

  bool breakpointBetween(String minBreakpoint, String maxBreakpoint) =>
      ResponsiveBreakpoints.of(this).between(minBreakpoint, maxBreakpoint);
}
