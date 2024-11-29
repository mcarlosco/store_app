import 'package:flutter/material.dart';

import '../../../domain/entities.dart';

import '../../widgets.dart';

final class ProductCardWidget extends StatelessWidget {
  final ProductEntity product;
  final int? descriptionTextMaxLines;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Icon? chipIcon;
  final String? chipText;

  const ProductCardWidget.outlined(
    this.product, {
    super.key,
    this.descriptionTextMaxLines,
    this.buttonText,
    this.onButtonPressed,
    this.chipIcon,
    this.chipText,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget.outlined(
      image: product.image,
      headline: '\$${product.priceStringAsFixed}',
      subhead: product.title,
      supportingText: product.description,
      supportingTextMaxLines: descriptionTextMaxLines,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      chipIcon: chipIcon,
      chipText: chipText,
    );
  }
}
