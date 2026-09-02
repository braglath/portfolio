import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_colors.dart';

class AppTextStyles {
  // ============================================================
  // DISPLAY
  // ============================================================

  // Main hero headline
  static const TextStyle displayLarge = TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.0,
  );

  // Large statement / CTA headline
  static const TextStyle displayMedium = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.05,
  );

  // ============================================================
  // HEADINGS
  // ============================================================

  // Main section headings
  static const TextStyle headingLarge = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  // Card / project headings
  static const TextStyle headingMedium = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // Small section / component headings
  static const TextStyle headingSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  // ============================================================
  // BODY
  // ============================================================

  // Hero supporting text / large introduction
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  // Default body text
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  // Secondary descriptions / supporting text
  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // ============================================================
  // UI
  // ============================================================

  // Primary buttons
  static const TextStyle button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.6,
  );

  // Navigation / tabs / interactive elements
  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );

  // Labels / meta / hints
  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.4,
  );

  // ============================================================
  // STATS
  // ============================================================

  // Numbers / statistics
  static const TextStyle stat = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
}
