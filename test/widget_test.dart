import 'package:deen_app/app/router/placeholder_page.dart';
import 'package:deen_app/core/constants/app_strings.dart';
import 'package:deen_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('placeholder start page renders with the app theme', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.light, home: const PlaceholderPage()),
    );

    expect(find.text(AppStrings.appName), findsOneWidget);
  });
}
