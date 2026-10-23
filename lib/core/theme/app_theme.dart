import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';
import 'app_text_styles.dart';

/// Maps the design tokens onto Material's [ThemeData], so stock widgets
/// pick up the design without per-widget styling.
abstract final class AppTheme {
  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      primaryContainer: AppColors.primaryLight,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
      outline: AppColors.border,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: AppFonts.primary,
      textTheme: const TextTheme(
        headlineLarge: AppTextStyles.h1,
        headlineMedium: AppTextStyles.h2,
        headlineSmall: AppTextStyles.h3,
        titleLarge: AppTextStyles.title,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.button,
        labelMedium: AppTextStyles.label,
        labelSmall: AppTextStyles.caption,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          disabledBackgroundColor: AppColors.disabled,
          disabledForegroundColor: AppColors.textOnPrimary,
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
          textStyle: AppTextStyles.button,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          side: const BorderSide(
            color: AppColors.primary,
            width: AppSizes.borderWidth,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
          textStyle: AppTextStyles.button,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.button,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        hintStyle: TextStyle(color: AppColors.textHint),
        errorStyle: TextStyle(color: AppColors.error),
        border: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.error),
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.transparent,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
        titleTextStyle: AppTextStyles.title,
        contentTextStyle: AppTextStyles.body,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: AppSizes.borderWidth,
        space: AppSizes.borderWidth,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.smAll),
      ),
    );
  }
}
