import 'package:flutter/material.dart';

import '../organisms/shopping_app_bar_widget.dart';
import '../organisms/shopping_cart_drawer_widget.dart';

import '../../../domain/entities.dart';

final class ShoppingScaffoldWidget extends StatelessWidget {
  final ShoppingCartItemEntity? item;
  final String title;
  final Widget? body;
  final FloatingActionButton? floatingActionButton;

  const ShoppingScaffoldWidget({
    super.key,
    this.item,
    required this.title,
    this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoppingAppBarWidget(
        title: Text(title),
      ),
      drawer: ShoppingCartDrawerWidget(item: item),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
