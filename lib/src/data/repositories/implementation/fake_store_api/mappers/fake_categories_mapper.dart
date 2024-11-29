import 'package:fake_store_api_pkg/fake_store_api_pkg.dart' as fake;

import '../../../../../domain/entities.dart';

final class FakeCategoriesMapper {
  const FakeCategoriesMapper();

  ProductCategoryEntity mapSingle(fake.CategoryModel category) =>
      ProductCategoryEntity(category.name);

  List<ProductCategoryEntity> mapMultiple(
          List<fake.CategoryModel> categories) =>
      categories.map(mapSingle).toList(growable: false);
}
