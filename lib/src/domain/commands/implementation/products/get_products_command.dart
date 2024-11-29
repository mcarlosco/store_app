import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../../data/repositories.dart';

import '../../../entities.dart';

import '../../abstraction/command.dart';

final class GetProductsCommand
    implements Command<Future<Coin<List<ProductEntity>, Exception>>, void> {
  final ProductsRepository _productsRepo;

  const GetProductsCommand(this._productsRepo);

  @override
  execute([_]) => _productsRepo.getProducts();
}
