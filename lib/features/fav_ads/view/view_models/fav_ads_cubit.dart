import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/fav_ads/data/repos/fav_ads_repo.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'fav_ads_state.dart';

class FavAdsCubit extends Cubit<FavAdsState> {
  FavAdsCubit(this._favAdsRepo) : super(FavAdsInitial());

  final FavAdsRepo _favAdsRepo;
  List<BookModel> bookModelList = [];
  // late SharedPreferences _prefs;


    void addNewFavBook(BookModel bookModel,String userAccessToken)async{
      emit(FavAdsLoading());
      var results = await _favAdsRepo.addFavAd(bookModel.id.toString() , userAccessToken);
      results.fold((l) {
        emit(AddFavAdsFailure(errorMessage: l.errorMessage));
      }, (r) {
        bookModelList.add(bookModel);
        emit(AddFavAdsSuccessfully());
      });
    }

  void removeFavBook(String bookId,String userAccessToken)async{
    emit(FavAdsLoading());
    var results = await _favAdsRepo.removeFavAd(bookId , userAccessToken);
    results.fold((l) {
       
      emit(RemoveFavAdsFailure(errorMessage: l.errorMessage));
    }, (r) {
      bookModelList.removeWhere((element) => element.id.toString() == bookId);
      emit(RemoveFavAdsSuccessfully());
    });
  }

    void fetchFavAds(String userAccessToken)async{
      emit(FavAdsLoading());
     var results =  await _favAdsRepo.fetchFavAds(userAccessToken);
     results.fold((l) {
       emit(FetchFavAdsFailure(errorMessage: l.errorMessage));
     }, (r) {
       bookModelList = [];
       bookModelList = r;
       emit(FetchFavAdsSuccessfully());
     });
    }



}
