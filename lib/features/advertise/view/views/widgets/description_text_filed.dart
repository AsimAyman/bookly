import 'package:Bookly/core/utils/measures.dart';
import 'package:flutter/material.dart';

class DescriptionTextField extends StatefulWidget {
  const DescriptionTextField({required this.validator,required this.textEditingController, super.key});
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;
  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        validator:widget.validator ,
        controller: widget.textEditingController,
        style: const TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        minLines: 10,
        maxLines: 10,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: const SizedBox(
            height: 238,
            child: Column(
              children: [
                Icon(
                  Icons.description_outlined,
                ),
              ],
            ),
          ),
          prefixIconColor: getColorWhenFocus(),
          label: const Text('Description'),
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          border: OutlineInputBorder(borderRadius: borderRadius),
        ),
      ),
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
