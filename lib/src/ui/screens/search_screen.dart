import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities.dart';

import '../notifiers.dart';
import '../screens.dart';
import '../widgets.dart';

final class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState._();
}

final class _SearchScreenState extends State<SearchScreen> {
  _SearchScreenState._();

  @override
  void initState() {
    super.initState();

    _addPostFrameCallback();
  }

  @override
  Widget build(BuildContext context) {
    return ShoppingScaffoldWidget(
      title: 'Search',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Product title',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  helperText:
                      '${context.select<ProductsNotifier, int>((notifier) => notifier.searchableProducts?.length ?? 0)} product(s)',
                ),
                onChanged: (title) {
                  context
                      .read<ProductsNotifier>()
                      .filterSearchableProducts(title);
                },
              ),
            ),
            const Divider(height: 0),
            Selector<ProductsNotifier, List<ProductEntity>?>(
              selector: (_, notifier) => notifier.searchableProducts,
              builder: (_, products, __) {
                return products != null
                    ? Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          children: [
                            for (final product in products)
                              ProductCardWidget.outlined(
                                product,
                                descriptionTextMaxLines: 3,
                                buttonText: 'View',
                                onButtonPressed: () {
                                  _onProductCardButtonPressed(context, product);
                                },
                                chipIcon: const Icon(Icons.star),
                                chipText: product.rating.rate.toString(),
                              ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addPostFrameCallback() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsNotifier>().clearSearchableProductsFilter();
    });
  }

  void _onProductCardButtonPressed(
      BuildContext context, ProductEntity product) {
    Navigator.of(context)
        .pushNamed<void>(detailsScreenPath, arguments: product)
        .ignore();
  }
}
