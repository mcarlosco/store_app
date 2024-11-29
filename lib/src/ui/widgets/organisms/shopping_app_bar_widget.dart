import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers.dart';

final class ShoppingAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? title;

  const ShoppingAppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Badge.count(
          count: context.select<ShoppingNotifier, int>(
              (notifier) => notifier.items.length),
          child: const Icon(Icons.shopping_cart_rounded),
        ),
      ),
      title: title,
    );
  }
}
