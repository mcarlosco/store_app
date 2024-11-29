import 'product_entity.dart';

final class ShoppingCartItemEntity {
  static const maxQuantity = 5;

  final ProductEntity product;
  final int quantity;

  const ShoppingCartItemEntity({
    required this.product,
    required this.quantity,
  });

  const ShoppingCartItemEntity.none(this.product) : quantity = 0;
}
