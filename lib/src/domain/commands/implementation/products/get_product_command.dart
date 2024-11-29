import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../../data/repositories.dart';

import '../../../entities.dart';

import '../../abstraction/command.dart';

final class GetProductCommand
    implements Command<Future<Coin<ProductEntity, Exception>>, int> {
  final ProductsRepository _productsRepo;

  const GetProductCommand(this._productsRepo);

  @override
  execute(id) => _productsRepo.getProduct(id);
}
