// ignore_for_file: must_be_immutable

import 'package:bookly/core/utils/validator_handler.dart';
import 'package:bookly/core/widgets/custom_main_button.dart';
import 'package:bookly/core/widgets/custom_text_form_field.dart';
import 'package:bookly/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:bookly/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Price extends StatelessWidget {
  Price({super.key});

  TextEditingController priceEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvertiseCubit,AdvertiseState>(
      listener: (context, state){} ,
      builder:(context, state) =>
       Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //PriceTextFormFiled(),
              CustomTextFormField(
                textEditingController: AdvertiseCubit.get(context).priceController,
                hintTxt: 'Price',
                textInputType: TextInputType.number,
                suffixText: 'EGP',
                validator:ValidatorHandler.priceValidator,
                iconData: Icons.price_change_outlined,
              ),
              // const SizedBox(height: 16,),
              // CustomDropDownMenu<String>(
              //   items: BookConditionHandler.allBookConditions,
              //   label: 'Book Conditions',
              //   onSelect: AdvertiseCubit.get(context).onSelectCondition,
              //   value: AdvertiseCubit.get(context).selectedCondition,
              // ),
              const SizedBox(height: 16,),
              CheckboxListTile(
                  title: const Text('Negotiable'), value: AdvertiseCubit.get(context).isNegotiable, onChanged: (value) => AdvertiseCubit.get(context).toggleNegotiable(value),),
              const SizedBox(height: 16,),

              CheckboxListTile(
                  title: const Text('Exchangeable'), value: AdvertiseCubit.get(context).isExchangeable, onChanged: (value) => AdvertiseCubit.get(context).toggleExchangeable(value),),
              const SizedBox(height: 24,),

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
        ),
      ),
    );
  }
}
