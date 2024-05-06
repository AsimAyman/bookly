import 'package:Bookly/core/utils/measures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNoAdsWidget extends StatelessWidget {
  const CustomNoAdsWidget({
    super.key,
    required this.txt
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/404.svg",
          width: deviceWidth * 0.8,
        ),
        const SizedBox(height: 24,),
        Text(
          txt,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
