import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities.dart';

import '../../notifiers.dart';
import '../../screens.dart';

final class ShoppingCartDrawerWidget extends StatelessWidget {
  final ShoppingCartItemEntity? item;

  const ShoppingCartDrawerWidget({
    super.key,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    final items =
        context.select<ShoppingNotifier, List<ShoppingCartItemEntity>>(
            (notifier) => notifier.items);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text('${items.length} product(s)'),
            ),
            const Divider(height: 0),
            Expanded(
              child: ListView(
                children: [
                  for (final item in items)
                    ListTile(
                      leading: Text(item.quantity.toString()),
                      title: Text(
                        item.product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text('\$${item.product.priceStringAsFixed}'),
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                      leadingAndTrailingTextStyle:
                          Theme.of(context).textTheme.bodyMedium,
                      onTap: () {
                        _onShoppingCartItemListTileTapped(context, item);
                      },
                      selected: this.item?.product.id == item.product.id,
                    ),
                ],
              ),
            ),
            const Divider(height: 0),
            ListTile(
              title: Text(
                  '\$${context.select<ShoppingNotifier, String>((notifier) => notifier.totalStringAsFixed)}'),
              subtitle: const Text('Total'),
              trailing: FilledButton(
                onPressed: items.isNotEmpty ? () {} : null,
                child: const Text('Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onShoppingCartItemListTileTapped(
      BuildContext context, ShoppingCartItemEntity item) {
    if (this.item != null) {
      if (this.item!.product.id == item.product.id) {
        Navigator.of(context).pop<void>();
      } else {
        Navigator.of(context)
          ..pop<void>()
          ..popAndPushNamed<void, void>(
            detailsScreenPath,
            arguments: item.product,
          ).ignore();
      }
    } else {
      Navigator.of(context)
          .popAndPushNamed<void, void>(
            detailsScreenPath,
            arguments: item.product,
          )
          .ignore();
    }
  }
}
