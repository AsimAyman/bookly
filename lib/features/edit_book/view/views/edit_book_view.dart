import 'package:book_extchange/core/routing/locator_service.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:book_extchange/features/edit_book/data/repos/edit_book_repo.dart';
import 'package:book_extchange/features/edit_book/view/view_models/edit_book_cubit.dart';
import 'package:book_extchange/features/edit_book/view/views/widgets/edit_book_body.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditBookView extends StatelessWidget {
  const EditBookView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBookCubit(getIt.get<EditBookRepo>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomHeadText(
            txt: "Edit Your Book",
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
        body: EditBookBody(bookModel: bookModel,),
      ),
    );
  }
}
