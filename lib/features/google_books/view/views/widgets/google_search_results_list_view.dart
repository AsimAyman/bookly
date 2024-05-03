import 'package:book_extchange/core/utils/stylies_handler.dart';
import 'package:book_extchange/core/widgets/custom_center_loading_widget.dart';
import 'package:book_extchange/core/widgets/custom_error_dialog.dart';
import 'package:book_extchange/features/google_books/view/view_models/google_books_cubit.dart';
import 'package:book_extchange/features/google_books/view/views/widgets/custom_google_book_conatiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleSearchResultsListView extends StatelessWidget {
  const GoogleSearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleBooksCubit, GoogleBooksState>(
      listener: (context, state) {
        if(state is FetchGoogleBookFailure){
          customErrorDialog(context, title: "Error", content: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Search Results",
                style: StylesHandler.textStyle16Bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            state is FetchGoogleBookLoading ? const CustomCenterLoadingWidget() : const SizedBox(),
            state is FetchGoogleBookSuccess ?  Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CustomGoogleBookContainer(bookModel: state.googleBooks[index]);
                },
                itemCount: state.googleBooks.length,
              
              ),
            ) : const SizedBox(),
          ],
        );
      },
    );
  }
}
