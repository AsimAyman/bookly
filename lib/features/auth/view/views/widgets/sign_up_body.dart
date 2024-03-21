import 'package:book_extchange/core/utils/validator_handler.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_white_logo_with_text.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_back_button.dart';

import 'package:book_extchange/features/auth/view/views/widgets/sign_up_drop_down_menu.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';

import 'package:book_extchange/features/auth/view/views/widgets/have_account.dart';

import 'package:flutter/material.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceHeight * .04,
                  ),
                  const CustomBackButton(),
                  SizedBox(
                    height: deviceHeight * .04,
                  ),
                  const CustomWhiteLogoWithText(),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomHeadText(
                    txt: "Sign Up",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    textEditingController: emailController,
                    hintTxt: "Email",
                    iconData: Icons.email,
                    validator: ValidatorHandler.emailValidator,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    textEditingController: nameController,
                    hintTxt: "Name",
                    iconData: Icons.email,
                    validator: ValidatorHandler.otherValidator,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    textEditingController: passwordController,
                    hintTxt: "Password",
                    iconData: Icons.lock,
                    isPassword: true,
                    validator: ValidatorHandler.passwordValidator,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const SignUpDropDownMenu(),
                      const Spacer(),
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: CustomTextFormField(
                          textEditingController: cityController,
                          hintTxt: "City",
                          iconData: Icons.location_city,
                          validator: ValidatorHandler.otherValidator,
                        ),
                      ),
                    ],
                  ),
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
                  CustomMainButton(
                      txt: "Sign Up",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print("yes");
                        } else {
                          print("no");
                        }
                      }),
                  const HaveAccount(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
