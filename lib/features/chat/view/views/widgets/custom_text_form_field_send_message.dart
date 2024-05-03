import 'package:flutter/material.dart';

class TextFormFieldSendMessage extends StatelessWidget {
  const  TextFormFieldSendMessage({super.key, required this.textEditingController,required this.onSumbit});
  final TextEditingController textEditingController;

  final void Function(String)? onSumbit;
  @override
  Widget build(BuildContext context) {
    MaterialStateColor getColorWhenFocus() {
      return MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.focused)
            ? Theme.of(context).colorScheme.primary
            : Colors.grey,
      );
    }

    return TextFormField(

      controller: textEditingController,
      onFieldSubmitted: onSumbit,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(

          suffixIconColor: getColorWhenFocus(),
          suffixIcon: IconButton(onPressed: () {
            onSumbit!(textEditingController.text);
          },icon: const Icon(Icons.send)),
          labelText: "Message",
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

}
