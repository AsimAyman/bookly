import 'package:book_extchange/features/google_books/view/views/widgets/google_search_view_body.dart';
import 'package:flutter/material.dart';

class GoogleSearchView extends StatelessWidget {
  const GoogleSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: GoogleSearchViewBody(),
      ),
    );
  }
}
