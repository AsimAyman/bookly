import 'package:Bookly/core/routing/routes.dart';
import 'package:Bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
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
        if (loginCubit.isSignedIn) {
          GoRouter.of(context).pushReplacementNamed(Routes.kHomeView);
        } else {
          GoRouter.of(context).pushReplacementNamed(Routes.kOnBoardingView);
        }
      },
    );
  }
}
