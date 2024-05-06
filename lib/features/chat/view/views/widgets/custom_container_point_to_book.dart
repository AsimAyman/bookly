import 'package:Bookly/core/routing/routes.dart';
import 'package:Bookly/core/utils/measures.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomContainerPointToBook extends StatelessWidget {
   CustomContainerPointToBook({super.key, required this.bookModel});
  BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.kBookDetailsView,extra: bookModel);
      },
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: AspectRatio(
                aspectRatio: 60 / 72,
                child: Image.network(
                  bookModel.imgsPath.first,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: deviceWidth - 150,
                  child: Text(
                    bookModel.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  bookModel.price ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey),
                )
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Icon(
                Icons.navigate_next_sharp,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
