import 'package:fake_store_api_pkg/fake_store_api_pkg.dart' as fake;
import 'package:fun_pro_pkg/fun_pro_pkg.dart';

import '../../../../../domain/entities.dart';

import '../../../abstraction/products_repository.dart';

import '../mappers/fake_categories_mapper.dart';
import '../mappers/fake_products_mapper.dart';

final class FakeProductsApi implements ProductsRepository {
  final fake.ProductsApi _productsApi;

  final FakeProductsMapper _fakeProductsMapper;
  final FakeCategoriesMapper _fakeCategoriesMapper;

  FakeProductsApi()
      : _productsApi = fake.ProductsApi(),
        _fakeProductsMapper = const FakeProductsMapper(),
        _fakeCategoriesMapper = const FakeCategoriesMapper();

  @override
  Future<Coin<List<ProductEntity>, Exception>> getProducts() {
    return _productsApi.getProducts().then((coin) {
      return coin.flip(
        (products) => Coin.heads(_fakeProductsMapper.mapMultiple(products)),
        Coin.tails,
      );
    });
  }

  @override
  Future<Coin<ProductEntity, Exception>> getProduct(int id) {
    return _productsApi.getProduct(id).then((coin) {
      return coin.flip(
        (product) => Coin.heads(_fakeProductsMapper.mapSingle(product)),
        Coin.tails,
      );
    });
  }

  @override
  Future<Coin<List<ProductCategoryEntity>, Exception>> getCategories() {
    return _productsApi.getCategories().then((coin) {
      return coin.flip(
        (categories) =>
            Coin.heads(_fakeCategoriesMapper.mapMultiple(categories)),
        Coin.tails,
      );
    });
  }
}
