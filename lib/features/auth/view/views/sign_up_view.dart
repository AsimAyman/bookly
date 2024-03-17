import 'package:book_extchange/core/routing/locator_service.dart';

import 'package:book_extchange/features/auth/data/repos/govern_repo/govern_repo_imp.dart';
import 'package:book_extchange/features/auth/view/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:book_extchange/features/auth/view/views/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(governRepo: getIt.get<GovernRepoImp>())..getGovs(),
        child: const SignUpBody(),
      ),
    );
  }
}
