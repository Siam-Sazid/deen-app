import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';

/// The app's loading spinner.
class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.size = AppSizes.loaderMd,
    this.color = AppColors.primary,
    this.strokeWidth = 3,
  });

  /// Small variant sized for use inside buttons.
  const AppLoader.small({super.key, this.color = AppColors.textOnPrimary})
    : size = AppSizes.loaderSm,
      strokeWidth = 2;

  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
    );
  }
}
