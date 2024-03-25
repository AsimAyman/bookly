import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'search_by_title_state.dart';

class SearchByTitleCubit extends Cubit<SearchByTitleState> {
  SearchByTitleCubit(this._dio) : super(SearchByTitleInitial());
  final Dio _dio;
  List<BookModel> bookModels = [];


  final TextEditingController textEditingController = TextEditingController();

   search(String txt)async{
    print('search $txt');
    emit(SearchByTitleSuccess());
  }

}
