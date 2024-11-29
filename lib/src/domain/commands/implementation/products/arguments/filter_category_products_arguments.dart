import '../../../../entities.dart';

final class FilterCategoryProductsArguments {
  final List<ProductEntity>? products;
  final ProductCategoryEntity category;

  const FilterCategoryProductsArguments({
    required this.products,
    required this.category,
  });
}
