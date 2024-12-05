import '../../../data/repositories.dart';
import '../../../domain/commands.dart';
import '../../../domain/entities.dart';

import '../abstraction/notifier.dart';

final class ProductsNotifier extends Notifier {
  final FilterCategoryProductsCommand _filterCategoryProductsCmd;
  final FilterFeaturedProductsCommand _filterFeaturedProductsCmd;
  final FilterPopularProductsCommand _filterPopularProductsCmd;
  final FilterSearchableProductsCommand _filterSearchableProductsCmd;
  final GetAllCategoriesCommand _getAllCategoriesCmd;
  final GetCategoriesCommand _getCategoriesCmd;
  final GetProductCommand _getProductCmd;
  final GetProductsCommand _getProductsCmd;
  final SortProductsCommand _sortProductsCmd;

  List<ProductCategoryEntity>? _categories;
  List<ProductEntity>? _categoryProducts;
  List<ProductEntity>? _featuredProducts;
  List<ProductEntity>? _popularProducts;
  List<ProductEntity>? _searchableProducts;
  List<ProductEntity>? _products;
  ProductEntity? _product;

  ProductsNotifier(ProductsRepository productsRepo)
      : _filterCategoryProductsCmd = const FilterCategoryProductsCommand(),
        _filterFeaturedProductsCmd = const FilterFeaturedProductsCommand(),
        _filterPopularProductsCmd = const FilterPopularProductsCommand(),
        _filterSearchableProductsCmd = const FilterSearchableProductsCommand(),
        _getAllCategoriesCmd = GetAllCategoriesCommand(productsRepo),
        _getCategoriesCmd = GetCategoriesCommand(productsRepo),
        _getProductCmd = GetProductCommand(productsRepo),
        _getProductsCmd = GetProductsCommand(productsRepo),
        _sortProductsCmd = const SortProductsCommand() {
    initState();
  }

  List<ProductCategoryEntity>? get categories => _categories;
  List<ProductEntity>? get categoryProducts => _categoryProducts;
  List<ProductEntity>? get featuredProducts => _featuredProducts;
  List<ProductEntity>? get popularProducts => _popularProducts;
  List<ProductEntity>? get searchableProducts => _searchableProducts;
  List<ProductEntity>? get products => _products;
  ProductEntity? get product => _product;

  bool get hasCategories => _categories != null;
  bool get hasCategoryProducts => _categoryProducts != null;
  bool get hasFeaturedProducts => _featuredProducts != null;
  bool get hasPopularProducts => _popularProducts != null;
  bool get hasSearchableProducts => _searchableProducts != null;
  bool get hasProducts => _products != null;
  bool get hasProduct => _product != null;

  @override
  void initState() {
    getProducts().then((_) {
      filterFeaturedProducts();
      filterPopularProducts();
    }).ignore();
  }

  void filterCategoryProducts(ProductCategoryEntity category) {
    _categoryProducts = _filterCategoryProductsCmd.execute(
      FilterCategoryProductsArguments(
        products: _products,
        category: category,
      ),
    );

    notifyListeners();
  }

  void filterFeaturedProducts() {
    _featuredProducts = _filterFeaturedProductsCmd.execute(_products);

    notifyListeners();
  }

  void filterPopularProducts() {
    _popularProducts = _filterPopularProductsCmd.execute(_products);

    notifyListeners();
  }

  void filterSearchableProducts(String title) {
    _searchableProducts = _filterSearchableProductsCmd.execute(
      FilterSearchableProductsArguments(
        products: _products,
        title: title,
      ),
    );

    notifyListeners();
  }

  Future<void> getAllCategories() {
    return _getAllCategoriesCmd.execute().then((coin) {
      coin.flip((categories) {
        _categories = categories;

        notifyListeners();
      }, handleException);
    });
  }

  Future<void> getCategories() {
    return _getCategoriesCmd.execute().then((coin) {
      coin.flip((categories) {
        _categories = categories;

        notifyListeners();
      }, handleException);
    });
  }

  Future<void> getProduct(int id) {
    return _getProductCmd.execute(id).then((coin) {
      coin.flip((product) {
        _product = product;

        notifyListeners();
      }, handleException);
    });
  }

  Future<void> getProducts() {
    return _getProductsCmd.execute().then((coin) {
      coin.flip((products) {
        _products = products;

        notifyListeners();
      }, handleException);
    });
  }

  void sortCategoryProducts(ProductSortingCriterionEntity criterion) {
    _sortProductsCmd.execute(
      SortProductsArguments(
        products: _categoryProducts,
        criterion: criterion,
      ),
    );

    notifyListeners();
  }

  void clearSearchableProductsFilter() {
    _searchableProducts = List.empty();

    notifyListeners();
  }

  @override
  void resetState() {
    super.resetState();
    _categories = null;
    _categoryProducts = null;
    _featuredProducts = null;
    _popularProducts = null;
    _searchableProducts = null;
    _products = null;
    _product = null;
  }
}
