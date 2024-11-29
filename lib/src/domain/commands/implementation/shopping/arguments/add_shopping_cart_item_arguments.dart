import '../../../../entities.dart';

final class AddShoppingCartItemArguments {
  final List<ShoppingCartItemEntity> items;
  final ShoppingCartItemEntity item;

  const AddShoppingCartItemArguments({
    required this.items,
    required this.item,
  });
}
