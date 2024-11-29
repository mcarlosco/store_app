import 'package:flutter/material.dart';

final class CardWidget extends StatelessWidget {
  final String? image;
  final String? headline;
  final String? subhead;
  final String? supportingText;
  final int? supportingTextMaxLines;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Icon? chipIcon;
  final String? chipText;

  const CardWidget.outlined({
    super.key,
    this.image,
    this.headline,
    this.subhead,
    this.supportingText,
    this.supportingTextMaxLines,
    this.buttonText,
    this.onButtonPressed,
    this.chipIcon,
    this.chipText,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card.outlined(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.network(image!),
              ),
            if (headline != null)
              Text(
                headline!,
                style: textTheme.titleLarge,
              ),
            if (subhead != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  subhead!,
                  style: textTheme.titleMedium,
                ),
              ),
            if (supportingText != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  supportingText!,
                  style: textTheme.bodySmall,
                  maxLines: supportingTextMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (buttonText != null)
                    FilledButton.tonal(
                      onPressed: onButtonPressed,
                      child: Text(buttonText!),
                    ),
                  if (chipText != null)
                    Chip(
                      avatar: chipIcon,
                      label: Text(chipText!),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
