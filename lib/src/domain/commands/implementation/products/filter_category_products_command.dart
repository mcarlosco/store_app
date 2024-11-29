import '../../../entities.dart';

import '../../abstraction/command.dart';

import 'arguments/filter_category_products_arguments.dart';

final class FilterCategoryProductsCommand
    implements Command<List<ProductEntity>?, FilterCategoryProductsArguments> {
  const FilterCategoryProductsCommand();

  @override
  execute(args) {
    return args.category.isWildcard
        ? args.products
        : args.products
            ?.where((product) => product.category.name == args.category.name)
            .toList(growable: false);
  }
}
