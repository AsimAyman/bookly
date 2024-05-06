import 'package:Bookly/core/widgets/custom_text_form_field.dart';
import 'package:Bookly/features/google_books/view/view_models/google_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGoogleSearchTextField extends StatelessWidget {
  const CustomGoogleSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
        child: CustomTextFormField(
            autoFocus: true,
            onChanged: (txt) {
              BlocProvider.of<GoogleBooksCubit>(context).fetchBooks(txt);
            },
            textEditingController: TextEditingController(),
            hintTxt: "Search",
            iconData: Icons.search) ,
    );
  }

  OutlineInputBorder _getCustomOutlineBorder(double radius, Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius,),
      borderSide: BorderSide(
          color: borderColor
      ),
    );
  }
}
