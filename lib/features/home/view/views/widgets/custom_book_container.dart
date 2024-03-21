
import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookContainer extends StatelessWidget {
  const CustomBookContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.kBookDetailsView);
      },
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorsHandler.kGrey1,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.2))
            ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.asset(
                "assets/images/book_cover_1.jpg",
                height: 180,
                width: 150,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "EGP 180",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceWidth - 220,
                  child: Text(
                    "Spring Book From png Tree with good price Spring Book From png Tree with good price",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const Spacer(),
                Text("Cairo", style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}