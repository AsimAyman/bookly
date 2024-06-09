import 'package:bookly/core/utils/stylies_handler.dart';
import 'package:bookly/features/google_books/data/models/google_book_model.dart';
import 'package:bookly/features/google_books/view/views/widgets/custom_book_image.dart';
import 'package:bookly/features/google_books/view/views/widgets/custom_buy_and_preview_row.dart';
import 'package:bookly/features/google_books/view/views/widgets/custom_rating_row.dart';
import 'package:flutter/material.dart';

class GoogleBookDetailsViewBody extends StatefulWidget {
  const GoogleBookDetailsViewBody({super.key,required this.bookModel});
  final GoogleBookModel bookModel;
  @override
  State<GoogleBookDetailsViewBody> createState() => _GoogleBookDetailsViewBodyState();
}

class _GoogleBookDetailsViewBodyState extends State<GoogleBookDetailsViewBody> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const BookDetailsAppBar(),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  right: size.width * 0.20,
                  left: size.width * 0.20,
                ),
                child:  CustomBookImage(imageUrl: widget.bookModel.imageUrl),
              ),
              const SizedBox(
                height: 30,
              ),
               Text(
                widget.bookModel.title,
                style: StylesHandler.textStyle30Sectra,
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                widget.bookModel.author,
                style: StylesHandler.textStyle18Sectra,
              ),
              const SizedBox(
                height: 15,
              ),
               CustomRatingRow(averageRating:  widget.bookModel.averageRating,ratingsCount:  widget.bookModel.ratingsCount),
              const SizedBox(
                height: 30,
              ),
              CustomBuyAndPreviewRow(previewLink: widget.bookModel.previewLink),
              const SizedBox(
                height: 40,
              ),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child:   Text(
              //     "You can also like",
              //     style: StylesHandler.textStyle16Bold,
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // const SimilliarBooksListViewBuilder(),
              // const SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
