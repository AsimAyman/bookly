import 'package:flutter/material.dart';

class CustomCenterLoadingWidget extends StatelessWidget {
  const CustomCenterLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
