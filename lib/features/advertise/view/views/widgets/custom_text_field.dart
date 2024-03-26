

import 'package:book_extchange/core/utils/measures.dart';
import 'package:flutter/material.dart';
class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          label:const  Text('Title'),
          prefixIcon: const Icon(Icons.title),
          border: OutlineInputBorder(
            borderRadius: borderRadius
          ),
      ),
    );
  }
}
