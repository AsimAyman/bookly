// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startNav(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () async {
        var loginCubit = BlocProvider.of<LoginCubit>(context);
        await loginCubit.checkIfSignedIn();
        print("loginCubit.isSignedIn is ${loginCubit.isSignedIn}");
        if (loginCubit.isSignedIn) {
          print(loginCubit.isSignedIn);
          print(loginCubit.userModel.id);
          print(loginCubit.userModel.name);
          print(loginCubit.userModel.email);
          print(loginCubit.userModel.mobileNumber);
          GoRouter.of(context).pushReplacementNamed(Routes.kHomeView);

        } else {
          GoRouter.of(context).pushReplacementNamed(Routes.kOnBoardingView);
        }
      },
    );
  }
}
