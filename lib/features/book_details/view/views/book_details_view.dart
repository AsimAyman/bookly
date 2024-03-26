import 'package:book_extchange/features/book_details/view/views/widgets/book_details_body.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key,required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  BookDetailsBody(bookModel: bookModel,),
    );
  }
}

