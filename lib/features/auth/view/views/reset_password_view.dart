import 'package:bookly/core/routing/locator_service.dart';
import 'package:bookly/features/auth/view/view_models/reset_password_cubit/reset_password_cubit.dart';
import 'package:bookly/features/auth/view/views/widgets/reset_password_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(getIt.get<Dio>()),
      child: const Scaffold(
        body: ResetPasswordBody(),
      ),
    );
  }
}
