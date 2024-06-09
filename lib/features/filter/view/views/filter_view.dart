import 'package:bookly/core/routing/locator_service.dart';
import 'package:bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:bookly/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:bookly/features/filter/data/repos/category_repo/category_repo.dart';
import 'package:bookly/features/filter/data/repos/filter_repo/filter_repo.dart';
import 'package:bookly/features/filter/view/view_models/filter_cubit.dart';
import 'package:bookly/features/filter/view/views/widgets/filter_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(getIt.get<FilterRepo>(),
          getIt.get<CategoryRepo>(), BlocProvider.of<LoginCubit>(context).userModel.accessToken, FilterInitial()),

      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomHeadText(
            txt: "Filter",
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
        body: const FilterBody(),
      ),
    );
  }
}
