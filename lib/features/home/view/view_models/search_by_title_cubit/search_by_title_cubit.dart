import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/home/data/repos/books_repo/book_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_by_title_state.dart';

class SearchByTitleCubit extends Cubit<SearchByTitleState> {
  SearchByTitleCubit(this._bookRepo) : super(SearchByTitleInitial());

  List<BookModel> bookModels = [];
  final BookRepo _bookRepo;

  final TextEditingController textEditingController = TextEditingController();

   search(String txt,BuildContext context)async{
     var results = await _bookRepo.fetchBooksByTitle(BlocProvider.of<LoginCubit>(context).userModel.accessToken,txt);
     results.fold((l) {
        print(l.errorMessage);
     }, (r) {
       bookModels = r;
       emit(SearchByTitleSuccess());
     });

  }

}
