import 'package:book_extchange/core/utils/measures.dart';
import 'package:flutter/material.dart';
class PriceTextFormFiled extends StatelessWidget {
  const PriceTextFormFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Price",
        prefixText: 'EGP ',
        border: OutlineInputBorder(borderRadius: borderRadius),
      ),
    );
  }
}
