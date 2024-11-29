import 'product_category_entity.dart';
import 'product_rating_entity.dart';

final class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final ProductRatingEntity rating;
  final ProductCategoryEntity category;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });

  String get priceStringAsFixed => price.toStringAsFixed(2);
}
