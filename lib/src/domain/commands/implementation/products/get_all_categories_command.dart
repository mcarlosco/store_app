import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../../data/repositories.dart';

import '../../../entities.dart';

import '../../abstraction/command.dart';

final class GetAllCategoriesCommand
    implements
        Command<Future<Coin<List<ProductCategoryEntity>, Exception>>, void> {
  final ProductsRepository _productsRepo;

  const GetAllCategoriesCommand(this._productsRepo);

  @override
  execute([_]) {
    return _productsRepo.getCategories().then((coin) {
      return coin.flip(
        (categories) => Coin.heads(
          categories.toList()
            ..insert(0, const ProductCategoryEntity.all())
            ..toList(growable: false),
        ),
        Coin.tails,
      );
    });
  }
}
