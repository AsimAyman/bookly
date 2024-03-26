import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:book_extchange/features/home/view/view_models/search_by_title_cubit/search_by_title_cubit.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_books_list_view_home.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_no_books_match_this_title.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_start_search_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchByTitleBody extends StatelessWidget {
  const SearchByTitleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchByTitleCubit, SearchByTitleState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                  autoFocus: true,
                  onChanged: (txt) {
                    BlocProvider.of<SearchByTitleCubit>(context)
                        .search(txt, context);
                  },
                  textEditingController:
                      BlocProvider.of<SearchByTitleCubit>(context)
                          .textEditingController,
                  hintTxt: "Search",
                  iconData: Icons.search),
              const SizedBox(
                height: 8,
              ),
              state is SearchByTitleInitial
                  ? const CustomStartSearchContainer()
                  : BlocProvider.of<SearchByTitleCubit>(context)
                          .bookModels
                          .isEmpty
                      ? const CustomNoBooksMatchThisTitle()
                      : CustomBooksListViewHome(
                          allBooks: BlocProvider.of<SearchByTitleCubit>(context)
                              .bookModels,
                        )
            ],
          ),
        );
      },
    );
  }
}
