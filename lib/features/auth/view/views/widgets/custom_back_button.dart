import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
   CustomBackButton({
    this.onPress,
    super.key,
  });
    void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(

        onPressed: () {
          if(onPress != null){
            onPress!();
            return;
          }
          GoRouter.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.primary,
          size: 34,
        ),
      ),
    );
  }
}