import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import 'app_loader.dart';

enum AppButtonVariant { primary, secondary, text }

/// The app's button. Styling comes from the theme; this widget only picks
/// the variant and handles the loading state.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
  });

  final String label;

  /// Null disables the button.
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  /// Shows a spinner and ignores taps.
  final bool isLoading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final onTap = isLoading ? null : onPressed;
    final child = isLoading
        ? AppLoader.small(
            color: variant == AppButtonVariant.primary
                ? AppColors.textOnPrimary
                : AppColors.primary,
          )
        : _Label(label: label, icon: icon);

    return switch (variant) {
      AppButtonVariant.primary => FilledButton(onPressed: onTap, child: child),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: onTap,
        child: child,
      ),
      AppButtonVariant.text => TextButton(onPressed: onTap, child: child),
    };
  }
}

class _Label extends StatelessWidget {
  const _Label({required this.label, this.icon});

  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final text = Text(label, maxLines: 1, overflow: TextOverflow.ellipsis);
    if (icon == null) return text;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon!,
        const SizedBox(width: AppSpacing.sm),
        Flexible(child: text),
      ],
    );
  }
}
