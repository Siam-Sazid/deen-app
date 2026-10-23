import 'package:flutter/painting.dart';

/// Every colour in the app. Widgets reference these names; hex values
/// appear nowhere else.
///
/// TODO(design): values are placeholders — replace with the Figma palette.
abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF1E6F5C);
  static const Color primaryLight = Color(0xFFE3F1EC);
  static const Color secondary = Color(0xFFC9A227);

  // Surfaces
  static const Color background = Color(0xFFF8F8F6);
  static const Color surface = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B6B6B);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Lines and states
  static const Color border = Color(0xFFE2E2E2);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color disabled = Color(0xFFBDBDBD);

  // Feedback
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFED6C02);
  static const Color error = Color(0xFFD32F2F);

  // Effects
  static const Color shadow = Color(0x14000000);
  static const Color overlay = Color(0x80000000);
  static const Color transparent = Color(0x00000000);
}
