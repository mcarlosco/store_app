final class ProductCategoryEntity {
  final String name;
  final bool isWildcard;

  const ProductCategoryEntity(this.name) : isWildcard = false;

  const ProductCategoryEntity.all()
      : name = 'all',
        isWildcard = true;
}
