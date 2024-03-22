import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/utils/validator_handler.dart';
import 'package:book_extchange/core/widgets/custom_error_dialog.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/core/widgets/custom_sucess_dialog.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:book_extchange/core/widgets/custom_white_logo_with_text.dart';
import 'package:book_extchange/features/auth/view/view_models/reset_password_cubit/reset_password_cubit.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_back_button.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          customErrorDialog(context,
              title: "Error", content: state.errorMessage);
        }
        if (state is ResetPasswordSuccessful) {
          customSucessDialog(context, title: "Sent", content: "sent");
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading,
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
                          txt: "Reset  Password",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Enter the email address associated with your account and we will send you link to reset your password",
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          textEditingController:
                              BlocProvider.of<ResetPasswordCubit>(context)
                                  .emailController,
                          hintTxt: "Email",
                          iconData: Icons.email,
                          validator: ValidatorHandler.emailValidator,
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
                          txt: "Send Email",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                            } else {
                              print("no");
                            }
                          },
                        ),
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
