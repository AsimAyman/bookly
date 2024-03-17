import 'package:book_extchange/features/splash/view/view_models/splash_cubit/splash_cubit.dart';
import 'package:book_extchange/features/splash/view/views/widgets/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const SplashBody(),
    );
  }
}
