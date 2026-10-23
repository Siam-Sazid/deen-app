import 'package:flutter/painting.dart';

import 'app_colors.dart';

/// Font families registered in pubspec.yaml.
///
/// TODO(design): add the Figma font files under assets/fonts/, register them
/// in pubspec.yaml and set the family name here.
abstract final class AppFonts {
  static const String? primary = null;
}

/// Every text style in the app. Font sizes appear nowhere else.
///
/// TODO(design): replace sizes, weights and line heights with the Figma
/// type scale. `height` is line-height / font-size.
abstract final class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle title = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.35,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  static const TextStyle label = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.35,
    color: AppColors.textSecondary,
  );
}
