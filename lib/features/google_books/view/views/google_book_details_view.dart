import 'package:book_extchange/features/google_books/data/models/google_book_model.dart';
import 'package:book_extchange/features/google_books/view/views/widgets/google_book_details_view_body.dart';

import 'package:flutter/material.dart';

class GoogleBookDetailsView extends StatelessWidget {
  const GoogleBookDetailsView({super.key,required this.bookModel});
  final GoogleBookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleBookDetailsViewBody(bookModel: bookModel),
    );
  }
}
