import '../../../../entities.dart';

final class FilterCategoryProductsArguments {
  final List<ProductEntity>? products;
  final ProductCategoryEntity category;

  const FilterCategoryProductsArguments({
    this.products,
    required this.category,
  });
}
