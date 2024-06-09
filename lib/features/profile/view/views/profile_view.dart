import 'package:bookly/core/routing/locator_service.dart';
import 'package:bookly/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:bookly/features/profile/view/view_models/profile_cubit/profile_cubit.dart';
import 'package:bookly/features/profile/view/views/widgets/profile_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt.get<Dio>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomHeadText(
            txt: "Profile",
          ),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                size: 32,
              )),
        ),
        body: const ProfileBody(),
      ),
    );
  }
}
