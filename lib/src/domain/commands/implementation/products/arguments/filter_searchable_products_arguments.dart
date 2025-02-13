import '../../../../entities.dart';

final class FilterSearchableProductsArguments {
  final List<ProductEntity>? products;
  final String title;

  const FilterSearchableProductsArguments({
    this.products,
    required this.title,
  });
}
