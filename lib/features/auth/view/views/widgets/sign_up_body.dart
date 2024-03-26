import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/validator_handler.dart';
import 'package:book_extchange/core/widgets/custom_error_dialog.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_white_logo_with_text.dart';
import 'package:book_extchange/features/auth/view/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_back_button.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_signup_successful_dialog.dart';

import 'package:book_extchange/features/auth/view/views/widgets/sign_up_drop_down_menu.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';

import 'package:book_extchange/features/auth/view/views/widgets/have_account.dart';

import 'package:flutter/material.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          customErrorDialog(context,
              title: "Error in Sign Up", content: state.errorMessage);
        }
        if (state is SignUpSuccessful) {
          customSignupSuccessfulDialog(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
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
                          textEditingController:
                              BlocProvider.of<SignUpCubit>(context)
                                  .emailController,
                          hintTxt: "Email",
                          iconData: Icons.email,
                          validator: ValidatorHandler.emailValidator,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          textEditingController:
                              BlocProvider.of<SignUpCubit>(context)
                                  .nameController,
                          hintTxt: "Name",
                          iconData: Icons.person,
                          validator: ValidatorHandler.otherValidator,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          textEditingController:
                              BlocProvider.of<SignUpCubit>(context)
                                  .phoneController,
                          hintTxt: "Phone",
                          iconData: Icons.phone,
                          validator: ValidatorHandler.phoneValidator,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          textEditingController:
                              BlocProvider.of<SignUpCubit>(context)
                                  .passwordController,
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
                             SignUpDropDownMenu(onChange: (value) {
                              BlocProvider.of<SignUpCubit>(context).selectNewGovern(value!);
                            },),
                            const Spacer(),
                            SizedBox(
                              width: deviceWidth * 0.45,
                              child: CustomTextFormField(
                                textEditingController:
                                    BlocProvider.of<SignUpCubit>(context)
                                        .cityController,
                                hintTxt: "City",
                                iconData: Icons.location_city,
                                validator: ValidatorHandler.cityValidator,
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
                                BlocProvider.of<SignUpCubit>(context).signUp();
                              } else {

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
          ),
        );
      },
    );
  }
}
