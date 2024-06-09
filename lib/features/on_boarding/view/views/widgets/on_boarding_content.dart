import 'package:bookly/core/utils/measures.dart';
import 'package:bookly/features/on_boarding/data/models/on_board_content_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.onBoardContentModel,
  });

  final OnBoardContentModel onBoardContentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          onBoardContentModel.img,
          width: deviceWidth * 0.7,
        ),
        const SizedBox(
          height: 36,
        ),
        Text(
          onBoardContentModel.title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            onBoardContentModel.description,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
