import 'package:book_extchange/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchAndFilterBar extends StatelessWidget {
  const CustomSearchAndFilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.kSearchByTitleView);
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Search for Book",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(Routes.kFilterView);

          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16)),
            child: const Center(
              child: Icon(
                Icons.filter_list,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }
}
