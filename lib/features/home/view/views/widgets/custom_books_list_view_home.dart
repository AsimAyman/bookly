import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/view/views/widgets/custom_book_container.dart';
import 'package:flutter/material.dart';

class CustomBooksListViewHome extends StatelessWidget {
  const CustomBooksListViewHome({super.key, required this.allBooks,this.myAds = false});

  final List<BookModel> allBooks;
  final bool myAds;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return  Column(
          children: [
            CustomBookContainer(bookModel: allBooks[index],myAd: myAds,),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      }, itemCount: allBooks.length,),
    );
  }
}