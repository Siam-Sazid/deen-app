import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_dimens.dart';

/// The app's top bar. Shows a back button whenever the router can pop.
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.title,
    this.actions,
    this.onBack,
    this.showBack = true,
  });

  final String? title;
  final List<Widget>? actions;

  /// Overrides the default `context.pop()`.
  final VoidCallback? onBack;
  final bool showBack;

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = showBack && (onBack != null || context.canPop());
    return AppBar(
      automaticallyImplyLeading: false,
      title: title == null ? null : Text(title!),
      actions: actions,
      leading: canPop
          ? IconButton(
              onPressed: onBack ?? context.pop,
              icon: const Icon(Icons.arrow_back_ios_new),
              iconSize: AppSizes.iconMd,
            )
          : null,
    );
  }
}
