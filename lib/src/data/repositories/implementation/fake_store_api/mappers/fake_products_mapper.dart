import 'package:fake_store_api_pkg/fake_store_api_pkg.dart' as fake;

import '../../../../../domain/entities.dart';

final class FakeProductsMapper {
  const FakeProductsMapper();

  ProductEntity mapSingle(fake.ProductModel product) => ProductEntity(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        image: product.image,
        rating: ProductRatingEntity(
          rate: product.rating.rate,
          count: product.rating.count,
        ),
        category: ProductCategoryEntity(product.category),
      );

  List<ProductEntity> mapMultiple(List<fake.ProductModel> products) =>
      products.map(mapSingle).toList(growable: false);
}
