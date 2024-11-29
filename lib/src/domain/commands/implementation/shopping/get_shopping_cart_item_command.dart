import '../../abstraction/command.dart';

import '../../../entities.dart';

import 'arguments/get_shopping_cart_item_arguments.dart';

final class GetShoppingCartItemCommand
    implements Command<ShoppingCartItemEntity, GetShoppingCartItemArguments> {
  const GetShoppingCartItemCommand();

  @override
  execute(args) {
    return args.items.firstWhere(
      (item) => item.product.id == args.product.id,
      orElse: () => ShoppingCartItemEntity.none(args.product),
    );
  }
}
