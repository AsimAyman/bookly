// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/google_books/data/models/google_book_model.dart';
import 'package:book_extchange/features/google_books/data/repos/google_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'google_books_state.dart';

class GoogleBooksCubit extends Cubit<GoogleBooksState> {
  GoogleBooksCubit(this._googleRepo) : super(GoogleBooksInitial());

  final GoogleRepo _googleRepo;


  void fetchBooks(String title) async {
    emit(FetchGoogleBookLoading());
    var results = await _googleRepo.fetchBooksByTitle(title);
    results.fold((l) {
      emit(FetchGoogleBookFailure(errorMessage: l.errorMessage));
    }, (r) {
      emit(FetchGoogleBookSuccess(googleBooks: r));
    });
  }
}
