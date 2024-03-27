import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintTxt,
    required this.iconData,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.isEnabled = true,
    this.autoFocus = false,
    this.onChanged,
    this.suffixText,

  });

  final TextEditingController textEditingController;
  final String hintTxt;
  final IconData iconData;
  final bool isPassword;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final bool autoFocus;
  final void Function(String)? onChanged;
  final String? suffixText;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      enabled: widget.isEnabled,
      validator: widget.validator,
      controller: widget.textEditingController,
      obscureText: isObscureText,
      style: const TextStyle(color: Colors.black),
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(

          prefixIcon: Icon(widget.iconData),
          prefixIconColor: getColorWhenFocus(),
          suffixIconColor: getColorWhenFocus(),
          suffixText: widget.suffixText,
          suffixIcon: widget.isPassword
              ? GestureDetector(
            onTap: () {
              isObscureText = !isObscureText;
              setState(() {});
            },
            child: isObscureText
                ? const Icon(
              Icons.visibility_off,
            )
                : const Icon(
              Icons.visibility,
            ),
          )
              : const SizedBox(),
          labelText: widget.hintTxt,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(
              24,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          )),

    );
  }

  MaterialStateColor getColorWhenFocus() {
    return MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.focused)
          ? Theme.of(context).colorScheme.primary
          : Colors.grey,
    );
  }
}
