import 'package:book_extchange/style/measures.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        labelText: "Email",
        suffixIcon: const Icon(Icons.email_outlined),
        labelStyle:const TextStyle(
            color: Colors.grey
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}