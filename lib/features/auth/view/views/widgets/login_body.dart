import 'package:book_extchange/core/utils/validator_handler.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_white_logo_with_text.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:book_extchange/features/auth/view/views/widgets/dont_have_account.dart';
import 'package:book_extchange/features/auth/view/views/widgets/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                      textEditingController: emailController,
                      hintTxt: "Email",
                      iconData:Icons.email,

                      validator: ValidatorHandler.emailValidator,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      textEditingController: passwordController,
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
                          print("yes");
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
  }
}



