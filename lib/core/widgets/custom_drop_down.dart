// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:Bookly/core/utils/measures.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    required this.items,
    super.key,
  });

  final List<T> items;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedValue,
      items: [
        ...widget.items.map((e) {
          String text = e.runtimeType ==String ? e:e.name;
          return DropdownMenuItem(value: e, child: Text(text));
        }),
      ],
      onChanged: (nwVal) {
        setState(() {
          selectedValue = nwVal;
        });
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
      decoration: InputDecoration(
        labelText: "Condition",
        border: OutlineInputBorder(borderRadius: borderRadius),
      ),
    );
  }
}
