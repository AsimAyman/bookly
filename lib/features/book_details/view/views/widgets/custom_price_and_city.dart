import 'package:flutter/material.dart';

class CustomPriceAndCity extends StatelessWidget {
  const CustomPriceAndCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "EGP 180",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                      fontWeight: FontWeight.bold,
                      color:
                      Theme.of(context).colorScheme.primary),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const Text("Downtown Cairo, Cairo")
          ],
        ),
        const Spacer(),
        const Text("12/4/2024")
      ],
    );
  }
}