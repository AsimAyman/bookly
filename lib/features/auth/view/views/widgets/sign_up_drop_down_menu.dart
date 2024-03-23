
import 'package:book_extchange/core/utils/govern_handler.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/features/auth/data/models/govern_model.dart';
import 'package:book_extchange/features/auth/view/view_models/sign_up_cubit/sign_up_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpDropDownMenu extends StatefulWidget {
  const SignUpDropDownMenu({super.key,required this.onChange,this.governModel});
 final void Function(GovernModel? governModel) onChange;
 final GovernModel? governModel;
  @override
  State<SignUpDropDownMenu> createState() => _SignUpDropDownMenuState();
}

class _SignUpDropDownMenuState extends State<SignUpDropDownMenu> {
  late List<GovernModel> items ;
  GovernModel? selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = GovernHandler.allGoverns;
    selectedItem = widget.governModel;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth * 0.45,
      child: DropdownButtonFormField<GovernModel>(
        validator: (value) {
          if(value == null){
            return "Please Select Your Governorate";
          }else{
            return null;
          }
        },
        menuMaxHeight: 300,
        decoration: InputDecoration(
          labelText: "Governorate",
          focusedBorder: border(),
          border: border(),
        ),
        value: selectedItem,
        items: items
            .map(
              (e) => DropdownMenuItem<GovernModel>(
            value: e,
            child: Text(
              e.name,
            ),
          ),
        )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedItem = value;
            widget.onChange(value);
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