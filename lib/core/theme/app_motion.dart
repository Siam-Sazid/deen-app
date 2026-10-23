import 'package:flutter/animation.dart';

/// Animation durations, matching the Figma prototype transitions.
///
/// TODO(design): replace with the durations set in Figma prototype mode.
abstract final class AppDurations {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration pageTransition = Duration(milliseconds: 300);
}

/// Animation curves, matching the Figma prototype easing.
///
/// Figma "Ease in and out" ≈ [easeInOut], "Ease out" ≈ [easeOut],
/// "Gentle"/"Quick" springs need a [SpringSimulation] instead.
abstract final class AppCurves {
  static const Curve standard = Curves.easeInOut;
  static const Curve enter = Curves.easeOut;
  static const Curve exit = Curves.easeIn;
}
