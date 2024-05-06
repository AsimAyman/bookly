// ignore_for_file: must_be_immutable

import 'package:Bookly/core/utils/validator_handler.dart';
import 'package:Bookly/core/widgets/custom_main_button.dart';
import 'package:Bookly/core/widgets/custom_text_form_field.dart';
import 'package:Bookly/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:Bookly/features/advertise/view/views/widgets/description_text_filed.dart';
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
          const SizedBox(
            height: 16,
          ),
          DescriptionTextField(
              validator: ValidatorHandler.descriptionValidator,
              textEditingController:
                  AdvertiseCubit.get(context).descriptionController),
          const SizedBox(
            height: 24,
          ),
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
