import '../../../entities.dart';

import '../../abstraction/command.dart';

import 'arguments/filter_searchable_products_arguments.dart';

final class FilterSearchableProductsCommand
    implements
        Command<List<ProductEntity>?, FilterSearchableProductsArguments> {
  const FilterSearchableProductsCommand();

  @override
  execute(args) {
    final title = args.title.trim().toLowerCase();

    return title.isEmpty
        ? List.empty()
        : args.products
            ?.where((product) => product.title.toLowerCase().contains(title))
            .toList(growable: false);
  }
}
