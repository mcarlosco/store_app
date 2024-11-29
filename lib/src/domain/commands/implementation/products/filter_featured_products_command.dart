import '../../../entities.dart';

import '../../abstraction/command.dart';

final class FilterFeaturedProductsCommand
    implements Command<List<ProductEntity>?, List<ProductEntity>?> {
  const FilterFeaturedProductsCommand();

  @override
  execute(products) {
    return products
        ?.where((product) =>
            product.rating.rate >= ProductRatingScaleEntity.satisfied &&
            product.rating.count >= 100 &&
            product.rating.count <= 200)
        .toList(growable: false);
  }
}
