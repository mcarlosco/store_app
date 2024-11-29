import 'package:flutter/material.dart';

import '../inputs/dropdown_menu_item_input.dart';

final class DropdownButtonWidget<T> extends StatelessWidget {
  final String? labelText;
  final String? helperText;
  final String? hintText;

  final T? value;
  final List<DropdownMenuItemInput<T>>? items;
  final ValueChanged<T?>? onChanged;

  const DropdownButtonWidget({
    super.key,
    this.labelText,
    this.helperText,
    this.hintText,
    this.value,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        helperText: helperText,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          borderRadius: BorderRadius.circular(15),
          hint: hintText != null ? Text(hintText!) : null,
          value: value,
          items: items
              ?.map(
                (item) => DropdownMenuItem(
                  value: item.value,
                  child: Text(
                    item.text,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          isExpanded: true,
        ),
      ),
    );
  }
}
