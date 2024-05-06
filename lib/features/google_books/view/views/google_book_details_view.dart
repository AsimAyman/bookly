import 'package:Bookly/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:Bookly/features/google_books/data/models/google_book_model.dart';
import 'package:Bookly/features/google_books/view/views/widgets/google_book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoogleBookDetailsView extends StatelessWidget {
  const GoogleBookDetailsView({super.key,required this.bookModel});
  final GoogleBookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  CustomHeadText(
          txt: bookModel.title,
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              size: 32,
            )),
      ),

      body: GoogleBookDetailsViewBody(bookModel: bookModel),
    );
  }
}
