
import 'package:Bookly/features/google_books/view/views/widgets/custom_google_search_text_field.dart';
import 'package:Bookly/features/google_books/view/views/widgets/google_search_results_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleSearchViewBody extends StatelessWidget {
  const GoogleSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomGoogleSearchTextField(),
        Expanded(child: GoogleSearchResultsListView()),
      ],
    );
  }
}
