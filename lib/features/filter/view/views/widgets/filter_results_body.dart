import 'package:book_extchange/core/widgets/custom_no_ads_widget.dart';
import 'package:book_extchange/features/filter/view/view_models/filter_cubit.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_books_list_view_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            books.length == 0 ? Padding(
              padding: const EdgeInsets.only(top: 36),
              child: const CustomNoAdsWidget(
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