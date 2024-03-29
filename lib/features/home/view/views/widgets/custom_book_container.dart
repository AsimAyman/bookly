import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/utils/theme.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_book_container_network_image.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookContainer extends StatelessWidget {
  const CustomBookContainer({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.kBookDetailsView,extra: bookModel);
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
              child: CustomBookContainerNetworkImage(image: bookModel.imgsPath[0]),
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
                  bookModel.price,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme
                      .of(context)
                      .colorScheme
                      .primary),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceWidth - 220,
                  child: Text(
                    bookModel.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
                  ),
                ),
                const Spacer(),
                Text(bookModel.govern, style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium),
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

