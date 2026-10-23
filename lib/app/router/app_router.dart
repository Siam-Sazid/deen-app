import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'placeholder_page.dart';

abstract final class AppRouter {
  static GoRouter create() {
    return GoRouter(
      initialLocation: AppRoutes.splash,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        // Replaced by the onboarding feature's splash page.
        GoRoute(
          path: AppRoutes.splash,
          builder: (BuildContext context, GoRouterState state) =>
              const PlaceholderPage(),
        ),
      ],
    );
  }
}
