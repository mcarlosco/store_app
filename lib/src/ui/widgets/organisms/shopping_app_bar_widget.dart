import 'package:design_system_pkg/design_system_pkg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers.dart';
import '../../screens.dart';

final class ShoppingAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? title;
  final bool searchActionVisible;

  const ShoppingAppBarWidget({
    super.key,
    required this.title,
    required this.searchActionVisible,
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
      actions: [
        if (searchActionVisible)
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed<void>(searchScreenPath).ignore();
            },
            icon: const Icon(Icons.search),
          ),
        IconButton(
          onPressed: () {
            showAlertDialog<void>(
              context,
              title: 'Hi, there! 🐵',
              content: 'I\'m Koko, and I\'ll be here to help you soon. '
                  'Meanwhile, please contact us on +1 (555) 555-KOKO.',
              buttonText: 'OK',
            ).ignore();
          },
          icon: const Icon(Icons.help_outline_rounded),
        ),
      ],
    );
  }
}
