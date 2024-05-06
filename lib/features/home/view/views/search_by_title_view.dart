import 'package:Bookly/core/routing/locator_service.dart';
import 'package:Bookly/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:Bookly/features/home/data/repos/books_repo/book_repo.dart';
import 'package:Bookly/features/home/view/view_models/search_by_title_cubit/search_by_title_cubit.dart';
import 'package:Bookly/features/home/view/views/widgets/search_by_title_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchByTitleView extends StatelessWidget {
  const SearchByTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchByTitleCubit(getIt.get<BookRepo>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomHeadText(
            txt: "Search",
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
        body: const SearchByTitleBody(),
      ),
    );
  }
}
