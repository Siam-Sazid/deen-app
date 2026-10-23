import 'package:flutter/painting.dart';

import 'app_colors.dart';

/// Spacing scale for padding, margins and gaps.
///
/// TODO(design): align the scale with the spacing used in Figma.
abstract final class AppSpacing {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;

  /// Horizontal padding of every screen.
  static const double screenHorizontal = lg;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
  );
}

/// Corner radii.
abstract final class AppRadius {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double pill = 999;

  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlAll = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));
}

/// Fixed component sizes that are not spacing (button heights, icon sizes).
abstract final class AppSizes {
  static const double buttonHeight = 52;
  static const double inputHeight = 52;
  static const double appBarHeight = 56;
  static const double iconSm = 16;
  static const double iconMd = 24;
  static const double iconLg = 32;
  static const double loaderSm = 20;
  static const double loaderMd = 32;
  static const double borderWidth = 1;
}

/// Box shadows.
abstract final class AppShadows {
  static const List<BoxShadow> card = [
    BoxShadow(color: AppColors.shadow, blurRadius: 12, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> elevated = [
    BoxShadow(color: AppColors.shadow, blurRadius: 24, offset: Offset(0, 8)),
  ];
}
