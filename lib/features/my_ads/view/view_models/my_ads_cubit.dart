import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/my_ads/data/repos/my_ads_repo/my_ads_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'my_ads_state.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  MyAdsCubit(this._myAdsRepo) : super(MyAdsInitial());


  final MyAdsRepo _myAdsRepo;



  void fetchMyBooks(BuildContext context) async {
    emit(FetchMyAdsLoading());
    var results = await _myAdsRepo.fetchMyBooks(BlocProvider.of<LoginCubit>(context).userModel.accessToken);
    results.fold((l) {
      emit(FetchMyAdsFailure(errorMessage: l.errorMessage));
    }, (r) {
      emit(FetchMyAdsSuccessful(allBooks: r));
    });
  }

  void deleteAdd(BuildContext context , String bookId)async{
    emit(FetchMyAdsLoading());
    var results = await _myAdsRepo.deleteBook(BlocProvider.of<LoginCubit>(context).userModel.accessToken,bookId);
    results.fold((l) {
      emit(FetchMyAdsFailure(errorMessage: l.errorMessage));
    }, (r) {
    });
  }

}
