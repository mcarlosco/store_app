import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../domain/entities.dart';

abstract interface class ProductsRepository {
  const ProductsRepository();

  Future<Coin<List<ProductEntity>, Exception>> getProducts();

  Future<Coin<ProductEntity, Exception>> getProduct(int id);

  Future<Coin<List<ProductCategoryEntity>, Exception>> getCategories();
}
