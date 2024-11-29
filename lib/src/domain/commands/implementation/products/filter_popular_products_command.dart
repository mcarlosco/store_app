import '../../../entities.dart';

import '../../abstraction/command.dart';

final class FilterPopularProductsCommand
    implements Command<List<ProductEntity>?, List<ProductEntity>?> {
  const FilterPopularProductsCommand();

  @override
  execute(products) {
    return products
        ?.where((product) =>
            product.rating.rate > ProductRatingScaleEntity.satisfied &&
            product.rating.count > 200)
        .toList(growable: false);
  }
}
