import 'package:flutter/material.dart';

class CustomSimpleAppBar extends StatelessWidget {
  const CustomSimpleAppBar({
    super.key,
    required this.txt,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 3,),
        Center(
          child: Text(
            txt,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900),
          ),
        ),
        const Spacer(flex: 2,),
        Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
      ],
    );
  }
}
