import 'package:flutter/material.dart';

class CustomHeadText extends StatelessWidget {
  const CustomHeadText({
    super.key,
    required this.txt,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
