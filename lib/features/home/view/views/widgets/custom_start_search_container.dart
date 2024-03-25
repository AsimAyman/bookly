import 'package:flutter/material.dart';

class CustomStartSearchContainer extends StatelessWidget {
  const CustomStartSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child:  Center(
        child: Text("Please Start Search by Book Title"),
      ),
    );
  }
}