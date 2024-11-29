import '../../../domain/commands.dart';
import '../../../domain/entities.dart';

import '../abstraction/notifier.dart';

final class ShoppingNotifier extends Notifier {
  final AddShoppingCartItemCommand _addShoppingCartItemCmd;
  final CalculateShoppingCartTotalCommand _calculateShoppingCartTotalCmd;
  final GetShoppingCartItemCommand _getShoppingCartItemCommand;

  late final ShoppingCartEntity _cart;

  late double _total;

  ShoppingNotifier()
      : _addShoppingCartItemCmd = const AddShoppingCartItemCommand(),
        _calculateShoppingCartTotalCmd =
            const CalculateShoppingCartTotalCommand(),
        _getShoppingCartItemCommand = const GetShoppingCartItemCommand() {
    initState();
  }

  @override
  void initState() {
    _cart = ShoppingCartEntity.empty();
    _total = 0;
  }

  List<ShoppingCartItemEntity> get items => _cart.items.toList(growable: false);

  double get total => _total;
  String get totalStringAsFixed => _total.toStringAsFixed(2);

  void addShoppingCartItem(ShoppingCartItemEntity item) {
    _addShoppingCartItemCmd.execute(
      AddShoppingCartItemArguments(
        items: _cart.items,
        item: item,
      ),
    );

    _total = _calculateShoppingCartTotalCmd.execute(_cart.items);

    notifyListeners();
  }

  ShoppingCartItemEntity? getShoppingCartItem(ProductEntity product) {
    return _getShoppingCartItemCommand.execute(
      GetShoppingCartItemArguments(
        items: _cart.items,
        product: product,
      ),
    );
  }
}
