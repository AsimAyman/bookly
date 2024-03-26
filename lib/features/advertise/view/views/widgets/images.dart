import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:flutter/material.dart';
class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Images'),


        ),
        CustomMainButton(
          txt: 'Next',
          onTap: () {
            //if (formKey.currentState!.validate()) {}

              AdvertiseCubit.get(context).nextStep(context);

          },
        )
      ],
    );
  }
}
