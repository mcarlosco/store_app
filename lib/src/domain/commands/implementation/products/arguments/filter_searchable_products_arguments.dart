import '../../../../entities.dart';

final class FilterSearchableProductsArguments {
  final List<ProductEntity>? products;
  final String title;

  const FilterSearchableProductsArguments({
    required this.products,
    required this.title,
  });
}
