import 'package:bookly/core/widgets/custom_no_ads_widget.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/view/views/widgets/custom_books_list_view_home.dart';
import 'package:flutter/cupertino.dart';

class FilterResultsBody extends StatelessWidget {
  const FilterResultsBody({super.key , required this.books});
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            books.length == 0 ? const Padding(
              padding:  EdgeInsets.only(top: 36),
              child:  CustomNoAdsWidget(
                txt:
                "There is No Ads Matches Your Filter Options Please Change it and try again",
              ),
            ) : CustomBooksListViewHome(
              allBooks: books,
            ),
          ],
        ),
      ),
    );
  }
}
