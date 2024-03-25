import 'package:book_extchange/core/routing/locator_service.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:book_extchange/features/home/view/view_models/search_by_title_cubit/search_by_title_cubit.dart';
import 'package:book_extchange/features/home/view/views/widgets/search_by_title_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchByTitleView extends StatelessWidget {
  const SearchByTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchByTitleCubit(getIt.get<Dio>()),
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
