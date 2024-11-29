import '../../../../entities.dart';

final class SortProductsArguments {
  final List<ProductEntity>? products;
  final ProductSortingCriterionEntity criterion;

  const SortProductsArguments({
    required this.products,
    required this.criterion,
  });
}