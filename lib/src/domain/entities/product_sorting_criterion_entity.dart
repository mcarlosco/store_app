enum ProductSortingCriterionEntity {
  byTitle._('title', ascendingFactor),
  byPrice._('price', ascendingFactor),
  byRating._('rating', descendingFactor);

  static const ascendingFactor = 1;
  static const descendingFactor = -1;

  final String name;
  final int orderFactor;

  const ProductSortingCriterionEntity._(
    this.name,
    this.orderFactor,
  );

  bool get isAscending => orderFactor == ascendingFactor;
  bool get isDescending => orderFactor == descendingFactor;
}
