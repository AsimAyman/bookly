import 'package:book_extchange/core/utils/book_condition_handler.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/utils/validator_handler.dart';
import 'package:book_extchange/core/widgets/custom_drop_down.dart';
import 'package:book_extchange/core/widgets/custom_drop_down_menu.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
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
              SizedBox(height: deviceHeight * .03),
              CustomDropDownMenu<String>(
                items: BookConditionHandler.allBookConditions,
                label: 'Book Conditions',
                onSelect: AdvertiseCubit.get(context).onSelectCondition,
                value: AdvertiseCubit.get(context).selectedCondition,
              ),
              SizedBox(height: deviceHeight * .03),
              CheckboxListTile(
                  title: const Text('Negotiable'), value: AdvertiseCubit.get(context).isNegotiable, onChanged: (value) => AdvertiseCubit.get(context).toggleNegotiable(value),),
              SizedBox(height: deviceHeight * .03),
              CheckboxListTile(
                  title: const Text('Exchangeable'), value: AdvertiseCubit.get(context).isExchangeable, onChanged: (value) => AdvertiseCubit.get(context).toggleExchangeable(value),),
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
