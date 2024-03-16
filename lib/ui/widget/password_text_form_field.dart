import 'package:flutter/material.dart';

import '../../style/measures.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        labelText: "Password",
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(icon:_isObscureText? Icon(Icons.visibility_outlined):Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscureText = !_isObscureText;
            });
          },),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
