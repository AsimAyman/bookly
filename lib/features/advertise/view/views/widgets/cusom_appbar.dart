
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_back_button.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({required this.appBar,super.key});
  final AppBar appBar;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CustomBackButton(onPress: (){AdvertiseCubit.get(context).backWordStep(context);}),
      title:const CustomHeadText(txt: 'Add New Book'),
      centerTitle: true,
    );

  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
