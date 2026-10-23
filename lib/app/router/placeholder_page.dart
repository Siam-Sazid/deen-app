import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_text_styles.dart';

/// Temporary start screen until the onboarding feature lands. Delete it then.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(AppStrings.appName, style: AppTextStyles.h1)),
    );
  }
}
