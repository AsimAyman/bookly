import 'package:Bookly/core/routing/locator_service.dart';
import 'package:Bookly/features/advertise/data/repo/add_book_repo.dart';
import 'package:Bookly/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:Bookly/features/advertise/view/views/widgets/cusom_appbar.dart';
import 'package:Bookly/features/advertise/view/views/widgets/custom_stepper.dart';
import 'package:Bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
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
      create: (context) => AdvertiseCubit(getIt.get<AddBookRepo>() , BlocProvider.of<LoginCubit>(context).userModel.accessToken),
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
