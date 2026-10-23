import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Labelled text input. Borders and fill come from the theme's
/// `inputDecorationTheme`.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.autofillHints,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;

  /// Server-side error (e.g. from `ApiException.fieldError`).
  final String? errorText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  /// Obscures the text and adds a show/hide toggle.
  final bool isPassword;
  final bool enabled;
  final int maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Iterable<String>? autofillHints;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscured = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.sm),
        ],
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: _obscured,
          enabled: widget.enabled,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          maxLength: widget.maxLength,
          autofillHints: widget.autofillHints,
          style: AppTextStyles.bodyLarge,
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () => setState(() => _obscured = !_obscured),
                    icon: Icon(
                      _obscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textSecondary,
                    ),
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
