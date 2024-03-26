import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class CustomPriceAndCity extends StatelessWidget {
  const CustomPriceAndCity({
    super.key,
  required this.bookModel
  });
  final BookModel bookModel;
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
                  "EGP ${bookModel.price}",
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
             Text("${bookModel.city}, ${bookModel.govern}")
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bookModel.isNegotiable == 1 ? Row(
              children: [
                Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Negotiable",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                      fontWeight: FontWeight.w400,
                      color:
                      Theme.of(context).colorScheme.primary),
                )
              ],
            ) : SizedBox(),
            const SizedBox(
              height: 4,
            ),
            bookModel.isExchangeable == 1 ? Row(
              children: [
                Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Exchangeable",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                      fontWeight: FontWeight.w400,
                      color:
                      Theme.of(context).colorScheme.primary),
                )
              ],
            ) : SizedBox(),
          ],
        ),
        // const Text("12/4/2024")
      ],
    );
  }
}