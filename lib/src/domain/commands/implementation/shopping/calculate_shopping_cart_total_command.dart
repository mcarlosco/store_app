import '../../../entities.dart';

import '../../abstraction/command.dart';

final class CalculateShoppingCartTotalCommand
    implements Command<double, List<ShoppingCartItemEntity>> {
  const CalculateShoppingCartTotalCommand();

  @override
  execute(items) {
    return items.fold<double>(
        0, (subtotal, item) => item.product.price * item.quantity + subtotal);
  }
}
