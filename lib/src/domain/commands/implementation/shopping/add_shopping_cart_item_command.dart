import '../../abstraction/command.dart';

import 'arguments/add_shopping_cart_item_arguments.dart';

final class AddShoppingCartItemCommand
    implements Command<void, AddShoppingCartItemArguments> {
  const AddShoppingCartItemCommand();

  @override
  execute(args) {
    final index = args.items
        .indexWhere((item) => item.product.id == args.item.product.id);

    if (index != -1) {
      if (args.item.quantity > 0) {
        args.items[index] = args.item;
      } else {
        args.items.removeAt(index);
      }
    } else {
      args.items.add(args.item);
    }
  }
}
