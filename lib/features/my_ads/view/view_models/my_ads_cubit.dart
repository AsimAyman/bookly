import 'package:Bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:Bookly/features/my_ads/data/repos/my_ads_repo/my_ads_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_ads_state.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  MyAdsCubit(this._myAdsRepo) : super(MyAdsInitial());


  final MyAdsRepo _myAdsRepo;



  void fetchMyBooks(String userToken) async {
    emit(FetchMyAdsLoading());
    var results = await _myAdsRepo.fetchMyBooks(userToken);
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
