import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/cusom_appbar.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvertiseView extends StatefulWidget {
  const AdvertiseView({super.key});

  @override
  State<AdvertiseView> createState() => _AdvertiseViewState();
}

class _AdvertiseViewState extends State<AdvertiseView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvertiseCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
        ),
        body:
        const CustomStepper(),
      ),
    );
  }
}
