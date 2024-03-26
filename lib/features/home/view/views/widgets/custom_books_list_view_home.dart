import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_book_container.dart';
import 'package:flutter/material.dart';

class CustomBooksListViewHome extends StatelessWidget {
  const CustomBooksListViewHome({super.key, required this.allBooks});

  final List<BookModel> allBooks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return  Column(
          children: [
            CustomBookContainer(bookModel: allBooks[index],),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      }, itemCount: allBooks.length,),
    );
  }
}