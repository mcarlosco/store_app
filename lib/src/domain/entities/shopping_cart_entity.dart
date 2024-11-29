import 'shopping_cart_item_entity.dart';

final class ShoppingCartEntity {
  final List<ShoppingCartItemEntity> items;

  ShoppingCartEntity({
    required this.items,
  });

  ShoppingCartEntity.empty() : this(items: List.empty(growable: true));
}
