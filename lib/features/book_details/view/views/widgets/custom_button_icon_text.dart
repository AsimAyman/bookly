import 'package:flutter/material.dart';

class CustomButtonIconText extends StatelessWidget {
  const CustomButtonIconText(
      {super.key,
      required this.txt,
      required this.iconData,
      this.onTap,
      this.isBackPrimary = true});

  final String txt;
  final void Function()? onTap;
  final bool isBackPrimary;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: isBackPrimary
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(vertical: 9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: isBackPrimary
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            txt,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isBackPrimary
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
