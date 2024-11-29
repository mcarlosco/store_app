import '../../../entities.dart';

import '../../abstraction/command.dart';

import 'arguments/sort_products_arguments.dart';

final class SortProductsCommand
    implements Command<void, SortProductsArguments> {
  const SortProductsCommand();

  @override
  execute(args) {
    final factor = args.criterion.orderFactor;

    switch (args.criterion) {
      case ProductSortingCriterionEntity.byTitle:
        args.products?.sort((p, q) => p.title.compareTo(q.title) * factor);
        break;
      case ProductSortingCriterionEntity.byPrice:
        args.products?.sort((p, q) => p.price.compareTo(q.price) * factor);
        break;
      case ProductSortingCriterionEntity.byRating:
        args.products
            ?.sort((p, q) => p.rating.rate.compareTo(q.rating.rate) * factor);
        break;
    }
  }
}
