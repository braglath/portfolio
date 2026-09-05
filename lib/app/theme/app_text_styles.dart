import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/core/responsive/responsive_font_size.dart';

class AppTextStyles {
  AppTextStyles._();

  // ============================================================
  // DISPLAY
  // ============================================================

  static TextStyle displayLarge(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 52,
      max: 96,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.0,
    );
  }

  static TextStyle displayMedium(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 40,
      max: 72,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.05,
    );
  }

  static TextStyle displaySmall(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 26,
      max: 46,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 0.7,
    );
  }

  // ============================================================
  // HEADINGS
  // ============================================================

  static TextStyle headingLarge(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 32,
      max: 48,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.1,
    );
  }

  static TextStyle headingMedium(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 24,
      max: 32,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      height: 1.2,
    );
  }

  static TextStyle headingSmall(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 20,
      max: 24,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      height: 1.25,
    );
  }

  // ============================================================
  // BODY
  // ============================================================

  static TextStyle bodyLarge(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 17,
      max: 20,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: AppColors.textSecondary,
      height: 1.6,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 15,
      max: 16,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.6,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 13,
      max: 14,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.5,
    );
  }

  // ============================================================
  // UI
  // ============================================================

  static TextStyle button(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 14,
      max: 15,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.textOnPrimary,
      letterSpacing: 0.6,
    );
  }

  static TextStyle labelMedium(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 13,
      max: 14,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      letterSpacing: 0.3,
    );
  }

  static TextStyle label(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 11,
      max: 12,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
      letterSpacing: 0.4,
    );
  }

  // ============================================================
  // STATS
  // ============================================================

  static TextStyle stat(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final fontSize = responsiveFontSize(
      width,
      min: 20,
      max: 24,
      minWidth: 320,
      maxWidth: 1440,
    );

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );
  }
}
