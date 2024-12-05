import 'package:design_system_pkg/design_system_pkg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities.dart';

import '../notifiers.dart';
import '../screens.dart';
import '../widgets.dart';

final class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState._();
}

final class _CatalogScreenState extends State<CatalogScreen> {
  ProductCategoryEntity? _category;
  ProductSortingCriterionEntity? _criterion;

  _CatalogScreenState._();

  @override
  void initState() {
    super.initState();

    _addPostFrameCallback();
    _category = const ProductCategoryEntity.all();
  }

  @override
  Widget build(BuildContext context) {
    return ShoppingScaffoldWidget(
      title: 'Catalog',
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Selector<ProductsNotifier,
                        List<ProductCategoryEntity>?>(
                      selector: (_, notifier) => notifier.categories,
                      builder: (_, categories, __) {
                        final products =
                            context.read<ProductsNotifier>().categoryProducts;

                        return DropdownButtonWidget(
                          labelText: 'Category',
                          hintText: 'none',
                          helperText: '${products?.length ?? 0} product(s)',
                          value: _category,
                          items: categories
                              ?.map(
                                (category) => DropdownMenuItemInput(
                                  value: category,
                                  text: category.name,
                                ),
                              )
                              .toList(),
                          onChanged: _onCategoryDropdownButtonChanged,
                        );
                      },
                    ),
                  ),
                  const HorizontalSpacerWidget.x4(),
                  Flexible(
                    child: DropdownButtonWidget(
                      labelText: 'Sort by',
                      hintText: 'default',
                      helperText: _criterion != null
                          ? _criterion!.isAscending
                              ? 'Ascending'
                              : 'Descending'
                          : 'Unordered',
                      value: _criterion,
                      items: ProductSortingCriterionEntity.values
                          .map(
                            (criterion) => DropdownMenuItemInput(
                              value: criterion,
                              text: criterion.name,
                            ),
                          )
                          .toList(),
                      onChanged: _onCriterionDropdownButtonChanged,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 0),
            Selector<ProductsNotifier, List<ProductEntity>?>(
              selector: (_, notifier) => notifier.categoryProducts,
              builder: (_, products, __) => products != null
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (_, index) {
                          final product = products[index];

                          return ProductCardWidget.outlined(
                            product,
                            descriptionTextMaxLines: 3,
                            buttonText: 'View',
                            onButtonPressed: () {
                              _onProductCardButtonPressed(product);
                            },
                            chipIcon: const Icon(Icons.star),
                            chipText: product.rating.rate.toString(),
                          );
                        },
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  void _addPostFrameCallback() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsNotifier>().getAllCategories().then((_) {
        _filterProducts();
      }).ignore();
    });
  }

  void _onCategoryDropdownButtonChanged(ProductCategoryEntity? category) {
    if (category != null) {
      setState(() {
        _category = category;
      });

      _filterProducts();
      _sortProducts();
    }
  }

  void _onCriterionDropdownButtonChanged(
      ProductSortingCriterionEntity? criterion) {
    if (criterion != null) {
      setState(() {
        _criterion = criterion;
      });

      _sortProducts();
    }
  }

  void _filterProducts() {
    if (_category != null) {
      context.read<ProductsNotifier>().filterCategoryProducts(_category!);
    }
  }

  void _sortProducts() {
    if (_criterion != null) {
      context.read<ProductsNotifier>().sortCategoryProducts(_criterion!);
    }
  }

  void _onProductCardButtonPressed(ProductEntity product) {
    Navigator.of(context)
        .pushNamed<void>(detailsScreenPath, arguments: product)
        .ignore();
  }
}
