import 'package:Bookly/core/utils/stylies_handler.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.borderRadius,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed:onTap,
        child: Text(
          text,
          style: StylesHandler.textStyle16Bold.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
