import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_white_logo_with_text.dart';
import 'package:book_extchange/features/auth/view/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_searchable_drop_down.dart';
import 'package:book_extchange/features/auth/view/views/widgets/dont_have_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceHeight * .04,
                  ),
                  const BackButton(),
                  SizedBox(
                    height: deviceHeight * .04,
                  ),
                  const CustomWhiteLogoWithText(),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomHeadText(txt: "Sign Up",),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    textEditingController: emailController,
                    hintTxt: "Email",
                    iconData: Icons.email,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    textEditingController: emailController,
                    hintTxt: "Name",
                    iconData: Icons.email,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    textEditingController: passwordController,
                    hintTxt: "Password",
                    iconData: Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const CustomSearchableDropDown(),
                      Spacer(),
                      const CustomSearchableDropDown(),

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
                      BlocProvider.of<SignUpCubit>(context).getCities();
                    },
                  ),
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
    );
  }
}



