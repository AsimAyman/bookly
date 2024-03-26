import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/validator_handler.dart';
import 'package:book_extchange/core/widgets/custom_error_dialog.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_white_logo_with_text.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:book_extchange/features/auth/view/views/widgets/dont_have_account.dart';
import 'package:book_extchange/features/auth/view/views/widgets/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is LoginFailure) {
      customErrorDialog(context,
          title: "Error in Login", content: state.errorMessage);
    }
    if (state is LoginSuccessful) {
      GoRouter.of(context).pushReplacementNamed(Routes.kHomeView);
    }
  },
  builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: state is LoginLoading,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceHeight * .1,
                    ),
                    const CustomWhiteLogoWithText(),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomHeadText(txt: "LOGIN",),

                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormField(
                      textEditingController: BlocProvider.of<LoginCubit>(context).emailController,
                      hintTxt: "Email",
                      iconData:Icons.email,

                      validator: ValidatorHandler.emailValidator,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      textEditingController: BlocProvider.of<LoginCubit>(context).passwordController,
                      hintTxt: "Password",
                      iconData:Icons.lock,
                      isPassword: true,
                      validator: ValidatorHandler.passwordValidator,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const ForgetPassword(),
                    const SizedBox(
                      height: 36,
                    ),

                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    CustomMainButton(txt: "Login",onTap: () {
                      if(formKey.currentState!.validate()){
                        BlocProvider.of<LoginCubit>(context).login();
                      }else{
                        print("no");
                      }
                    },),
                    const DontHaveAccount(),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }
}



