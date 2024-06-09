import 'package:bookly/core/widgets/custom_error_dialog.dart';
import 'package:bookly/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:bookly/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
      listener: (context, state) {
        if(state is AddBookFailureState){
          customErrorDialog(context, title: "Error", content: state.errorMessage);
        }
      },
      builder: (context, state) => LayoutBuilder(
        builder: (context, constraints) => ModalProgressHUD(
          inAsyncCall: state is AddBookLoadingState,
          child: Stepper(
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
      ),
    );
  }
}
