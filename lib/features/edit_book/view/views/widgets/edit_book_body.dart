import 'package:book_extchange/core/utils/validator_handler.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/description_text_filed.dart';
import 'package:book_extchange/features/edit_book/view/view_models/edit_book_cubit.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBookBody extends StatefulWidget {
  const EditBookBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<EditBookBody> createState() => _EditBookBodyState();
}

class _EditBookBodyState extends State<EditBookBody> {
   GlobalKey<FormState> formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    var editCubit = BlocProvider.of<EditBookCubit>(context);
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16,),

              CustomTextFormField(
                hintTxt: "Title",
                textEditingController: editCubit.titleEditingController,
                iconData: Icons.title_outlined,
                validator: ValidatorHandler.titleValidator,
              ),
              const SizedBox(height: 16,),
        
              CustomTextFormField(
                textEditingController: editCubit.priceEditingController,
                hintTxt: 'Price',
                textInputType: TextInputType.number,
                suffixText: 'EGP',
                validator:ValidatorHandler.priceValidator,
                iconData: Icons.price_change_outlined,
              ),
              const SizedBox(height: 16,),
              DescriptionTextField(
                  validator: ValidatorHandler.descriptionValidator,
                  textEditingController: editCubit.descriptionEditingController),
              const SizedBox(height: 24,),
              CustomMainButton(
                txt: 'Save',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    editCubit.editBook(widget.bookModel);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
