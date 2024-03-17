import 'package:bloc/bloc.dart';
import 'package:book_extchange/core/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startNav(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).pushReplacementNamed(Routes.kOnBoardingView);

      },
    );
  }
}
