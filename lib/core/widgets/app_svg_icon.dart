import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_dimens.dart';

/// Renders an SVG asset from `AppIcons`, optionally tinted.
class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon(
    this.asset, {
    super.key,
    this.size = AppSizes.iconMd,
    this.color,
  });

  final String asset;
  final double size;

  /// Null keeps the SVG's own colours.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
