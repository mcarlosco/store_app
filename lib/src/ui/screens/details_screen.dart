import 'package:design_system_pkg/design_system_pkg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities.dart';

import '../notifiers.dart';
import '../widgets.dart';

final class DetailsScreen extends StatefulWidget {
  final ProductEntity product;

  const DetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

final class _DetailsScreenState extends State<DetailsScreen> {
  ShoppingCartItemEntity? _item;

  @override
  void initState() {
    super.initState();

    _addPostFrameCallback(context);
  }

  @override
  Widget build(BuildContext context) {
    return ShoppingScaffoldWidget(
      item: _item,
      title: 'Details',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  return ProductCardWidget.outlined(
                    widget.product,
                    descriptionTextMaxLines: 10,
                    buttonText: 'Buy',
                    onButtonPressed: _item != null && _item!.quantity > 0
                        ? () => _onProductCardButtonPressed(context)
                        : null,
                    chipIcon: const Icon(Icons.star_rate_rounded),
                    chipText:
                        '${widget.product.rating.rate} (${widget.product.rating.count})',
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Flexible(
                          child: Text(
                            'Add to cart:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 100,
                            child: DropdownButtonWidget(
                              labelText: 'Quantity',
                              helperText: 'Added',
                              hintText: '?',
                              value: _item?.quantity,
                              items: List.generate(
                                ShoppingCartItemEntity.maxQuantity + 1,
                                (index) => DropdownMenuItemInput(
                                  value: index,
                                  text: index.toString(),
                                ),
                              ).reversed.toList(),
                              onChanged: (quantity) {
                                _onShoppingCartItemDropdownButtonChanged(
                                    context, quantity);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addPostFrameCallback(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setItem();
    });
  }

  void _setItem() {
    setState(() {
      _item =
          context.read<ShoppingNotifier>().getShoppingCartItem(widget.product);
    });
  }

  void _onProductCardButtonPressed(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void _onShoppingCartItemDropdownButtonChanged(
      BuildContext context, int? quantity) {
    if (quantity != null) {
      context.read<ShoppingNotifier>().addShoppingCartItem(
            ShoppingCartItemEntity(
              product: widget.product,
              quantity: quantity,
            ),
          );

      _setItem();
    }
  }
}
