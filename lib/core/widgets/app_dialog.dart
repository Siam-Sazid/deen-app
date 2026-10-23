import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';
import 'app_button.dart';

/// App-styled dialogs. Shape and colour come from the theme's `dialogTheme`.
abstract final class AppDialog {
  /// Asks the user to confirm an action. Resolves to `true` on confirm.
  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = AppStrings.ok,
    String cancelLabel = AppStrings.cancel,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierColor: AppColors.overlay,
      builder: (context) => Dialog(
        insetPadding: AppSpacing.screenPadding,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                message,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: cancelLabel,
                      variant: AppButtonVariant.secondary,
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppButton(
                      label: confirmLabel,
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return result ?? false;
  }
}
