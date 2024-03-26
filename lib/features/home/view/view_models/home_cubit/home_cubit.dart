// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/home/data/repos/books_repo/book_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._bookRepo) : super(HomeInitial());

  final BookRepo _bookRepo;



  void fetchBooks(BuildContext context) async {
    emit(HomeFetchDataLoading());
    var results = await _bookRepo.fetchallBooks(BlocProvider.of<LoginCubit>(context).userModel.accessToken);
    results.fold((l) {
      emit(HomeFetchDataFailure(errorMessage: l.errorMessage));
    }, (r) {
      emit(HomeFetchDataSuccessful(allBooks: r));
    });
  }
}
