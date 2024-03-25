import 'package:flutter/material.dart';

class CustomNoBooksMatchThisTitle extends StatelessWidget {
  const CustomNoBooksMatchThisTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child:  Center(
        child: Text("Sorry, there is no book matches this title please try another one"),
      ),
    );
  }
}