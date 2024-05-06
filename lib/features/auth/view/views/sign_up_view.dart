
import 'package:Bookly/core/routing/locator_service.dart';
import 'package:Bookly/features/auth/view/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:Bookly/features/auth/view/views/widgets/sign_up_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt.get<Dio>()),
        child: const SignUpBody(),
      ),
    );
  }
}
