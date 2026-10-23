import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';
import 'router/app_router.dart';

class DeenApp extends StatefulWidget {
  const DeenApp({super.key});

  /// Largest system font scale the layouts are designed to absorb.
  static const double maxTextScale = 1.3;

  @override
  State<DeenApp> createState() => _DeenAppState();
}

class _DeenAppState extends State<DeenApp> {
  final GoRouter _router = AppRouter.create();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: _router,
      builder: (context, child) => MediaQuery.withClampedTextScaling(
        maxScaleFactor: DeenApp.maxTextScale,
        child: child!,
      ),
    );
  }
}
