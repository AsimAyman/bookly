import 'package:bookly/core/utils/measures.dart';
import 'package:flutter/material.dart';

class CustomWhiteLogoWithText extends StatelessWidget {
  const CustomWhiteLogoWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png',
        width: deviceWidth * .34, height: deviceHeight * .13);
  }
}
