import 'package:Bookly/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:Bookly/features/filter/view/views/widgets/filter_results_body.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterResultsView extends StatelessWidget {
  const FilterResultsView({super.key , required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomHeadText(
          txt: "Filter Results",
        ),
        elevation: 0,
        actions: [
          Text("Results: ${books.length}   ")
        ],
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
      body: FilterResultsBody(books: books,),
    );
  }
}
