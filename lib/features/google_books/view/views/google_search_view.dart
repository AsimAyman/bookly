import 'package:book_extchange/core/routing/locator_service.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:book_extchange/features/google_books/data/repos/google_repo.dart';
import 'package:book_extchange/features/google_books/view/view_models/google_books_cubit.dart';
import 'package:book_extchange/features/google_books/view/views/widgets/google_search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GoogleSearchView extends StatelessWidget {
  const GoogleSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleBooksCubit(getIt.get<GoogleRepo>()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const CustomHeadText(
              txt: "E-Books",
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

          body: const GoogleSearchViewBody(),
        ),
      ),
    );
  }
}
