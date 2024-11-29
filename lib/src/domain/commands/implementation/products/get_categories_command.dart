import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../../data/repositories.dart';

import '../../../entities.dart';

import '../../abstraction/command.dart';

final class GetCategoriesCommand
    implements
        Command<Future<Coin<List<ProductCategoryEntity>, Exception>>, void> {
  final ProductsRepository _productsRepo;

  const GetCategoriesCommand(this._productsRepo);

  @override
  execute([_]) => _productsRepo.getCategories();
}
