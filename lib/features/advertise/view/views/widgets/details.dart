import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/utils/validator_handler.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/description_text_filed.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintTxt: "Title",
            textEditingController: AdvertiseCubit.get(context).titleController,
            iconData: Icons.title_outlined,
            validator: ValidatorHandler.titleValidator,
          ),
          SizedBox(
            height: deviceHeight * .03,
          ),
          DescriptionTextField(
              validator: ValidatorHandler.descriptionValidator,
              textEditingController:
                  AdvertiseCubit.get(context).descriptionController),
          CustomMainButton(
            txt: 'Next',
            onTap: () {
              if (formKey.currentState!.validate()) {
                AdvertiseCubit.get(context).nextStep(context);
              }
            },
          )
        ],
      ),
    );
  }
}
