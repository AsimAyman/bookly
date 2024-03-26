import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({
    super.key,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvertiseCubit, AdvertiseState>(
      listener: (context, state) {},
      builder: (context, state) => LayoutBuilder(
        builder: (context, constraints) => Stepper(
          currentStep: AdvertiseCubit.get(context).stepIndex,
          type: StepperType.horizontal,
          steps: [
            ...AdvertiseCubit.get(context).steps.map(
                  (step) => Step(
                    title: const Text(''),
                    content: step,
                    isActive: AdvertiseCubit.get(context).stepIndex >=
                        AdvertiseCubit.get(context).steps.indexOf(step),
                  ),
                )
          ],
          controlsBuilder: (context, details) => Container(),
        ),
      ),
    );
  }
}
