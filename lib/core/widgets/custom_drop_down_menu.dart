// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomDropDownMenu<T> extends StatefulWidget {
   CustomDropDownMenu({ required this.value,required this.onSelect,required this.items, required this.label,this.width,super.key});

  final String label;
  final List<T> items;
  final double? width;
  void Function (void) onSelect;
  dynamic value;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null) {
            return "Please Select Your Governorate";
          } else {
            return null;
          }
        },
        menuMaxHeight: 300,
        decoration: InputDecoration(
          labelText: widget.label,
          focusedBorder: border(),
          border: border(),
        ),
        value: widget.value,
        items: [
          ...widget.items.map((e) {
            String text = e.runtimeType ==String ? e:e.name;
            return DropdownMenuItem(value: e, child: Text(text));
          }),
        ],
        onChanged: (nwVal) {
          setState(() {
            widget.onSelect(nwVal);
            // selectedItem = value! as GovernModel;
            //  BlocProvider.of<SignUpCubit>(context).selectNewGovern(value as GovernModel);
          });
        },
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey, width: 1));
  }
}
