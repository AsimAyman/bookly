import 'package:Bookly/core/utils/govern_handler.dart';
import 'package:Bookly/core/utils/measures.dart';
import 'package:Bookly/core/utils/validator_handler.dart';
import 'package:Bookly/core/widgets/custom_error_dialog.dart';
import 'package:Bookly/core/widgets/custom_main_button.dart';
import 'package:Bookly/core/widgets/custom_sucess_dialog.dart';
import 'package:Bookly/core/widgets/custom_text_form_field.dart';
import 'package:Bookly/features/auth/data/models/govern_model.dart';
import 'package:Bookly/features/auth/view/views/widgets/sign_up_drop_down_menu.dart';
import 'package:Bookly/features/profile/view/view_models/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  GovernModel? initGovernModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String governName =
        BlocProvider.of<ProfileCubit>(context).getUserGovernName(context);
    initGovernModel = GovernHandler.getGoverModelByName(governName);
    BlocProvider.of<ProfileCubit>(context)
        .initController(context, initGovernModel);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailure) {
          customErrorDialog(context,
              title: "Error in Update", content: state.errorMessage);
        }
        if (state is ProfileSuccessful) {
          customSucessDialog(context,
              title: "Congratulations",
              content: "Your Profile Update Successfully");
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ProfileLoading,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          isEnabled: false,
                          textEditingController:
                              BlocProvider.of<ProfileCubit>(context)
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
                              BlocProvider.of<ProfileCubit>(context)
                                  .nameController,
                          hintTxt: "Name",
                          iconData: Icons.person,
                          validator: ValidatorHandler.otherValidator,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          isEnabled: false,
                          textEditingController:
                              BlocProvider.of<ProfileCubit>(context)
                                  .phoneController,
                          hintTxt: "Phone",
                          iconData: Icons.phone,
                          validator: ValidatorHandler.phoneValidator,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SignUpDropDownMenu(
                              onChange: (value) {
                                BlocProvider.of<ProfileCubit>(context)
                                    .selectNewGovern(value!);
                              },
                              governModel: initGovernModel,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: deviceWidth * 0.45,
                              child: CustomTextFormField(
                                textEditingController:
                                    BlocProvider.of<ProfileCubit>(context)
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
                            txt: "Update",
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<ProfileCubit>(context)
                                    .updateProfile(context);
                              } else {
                              }
                            }),
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
