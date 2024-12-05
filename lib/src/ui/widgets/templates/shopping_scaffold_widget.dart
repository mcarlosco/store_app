import 'package:flutter/material.dart';

import '../organisms/shopping_app_bar_widget.dart';
import '../organisms/shopping_cart_drawer_widget.dart';

import '../../../domain/entities.dart';

final class ShoppingScaffoldWidget extends StatelessWidget {
  final ShoppingCartItemEntity? item;
  final String title;
  final bool searchActionVisible;
  final Widget? body;
  final FloatingActionButton? floatingActionButton;

  const ShoppingScaffoldWidget({
    super.key,
    this.item,
    required this.title,
    this.searchActionVisible = false,
    this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoppingAppBarWidget(
        title: Text(title),
        searchActionVisible: searchActionVisible,
      ),
      drawer: ShoppingCartDrawerWidget(item: item),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
