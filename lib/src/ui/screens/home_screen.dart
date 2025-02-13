import 'package:design_system_pkg/design_system_pkg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities.dart';

import '../notifiers.dart';
import '../widgets.dart';

import 'screen_paths.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ShoppingScaffoldWidget(
      title: 'Coco Store 🌴',
      searchActionVisible: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              const Text(
                '🌊 The most fresh products for everyone 😎',
                textAlign: TextAlign.center,
              ),
              const VerticalSpacerWidget.x2(),
              Selector<ProductsNotifier, List<ProductEntity>?>(
                selector: (_, notifier) => notifier.featuredProducts,
                builder: (context, products, _) => products != null
                    ? Column(
                        children: [
                          for (final product in products)
                            ProductCardWidget.outlined(
                              product,
                              descriptionTextMaxLines: 3,
                              buttonText: 'View',
                              onButtonPressed: () {
                                _onProductCardButtonPressed(context, product);
                              },
                              chipIcon: const Icon(
                                  Icons.local_fire_department_outlined),
                              chipText: 'Featured',
                            ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Selector<ProductsNotifier, List<ProductEntity>?>(
                selector: (_, notifier) => notifier.popularProducts,
                builder: (context, products, _) => products != null
                    ? Column(
                        children: [
                          for (final product in products)
                            ProductCardWidget.outlined(
                              product,
                              descriptionTextMaxLines: 3,
                              buttonText: 'View',
                              onButtonPressed: () {
                                _onProductCardButtonPressed(context, product);
                              },
                              chipIcon: const Icon(Icons.group_outlined),
                              chipText: 'Popular',
                            ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _onFloatingActionButtonPressed(context);
        },
        icon: const Text('🥥'),
        label: const Text('Catalog'),
      ),
    );
  }

  void _onProductCardButtonPressed(
      BuildContext context, ProductEntity product) {
    Navigator.of(context)
        .pushNamed<void>(detailsScreenPath, arguments: product)
        .ignore();
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed<void>(catalogScreenPath).ignore();
  }
}
