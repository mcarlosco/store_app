import '../../../../entities.dart';

final class GetShoppingCartItemArguments {
  final List<ShoppingCartItemEntity> items;
  final ProductEntity product;

  const GetShoppingCartItemArguments({
    required this.items,
    required this.product,
  });
}
