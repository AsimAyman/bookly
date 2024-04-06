import 'package:book_extchange/core/routing/locator_service.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:book_extchange/features/filter/data/repos/category_repo/category_repo.dart';
import 'package:book_extchange/features/filter/data/repos/filter_repo/filter_repo.dart';
import 'package:book_extchange/features/filter/view/view_models/filter_cubit.dart';
import 'package:book_extchange/features/filter/view/views/widgets/filter_results_body.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
