import 'package:bloc/bloc.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/features/fav_ads/data/repos/fav_ads_repo.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'fav_ads_state.dart';

class FavAdsCubit extends Cubit<FavAdsState> {
  FavAdsCubit(this._favAdsRepo) : super(FavAdsInitial());

  final FavAdsRepo _favAdsRepo;
  List<BookModel> bookModelList = [];
  List<String> favAds = [];
  late SharedPreferences _prefs;

  void addNewFavBook(String newId)async{
    _prefs = await SharedPreferences.getInstance();
    favAds.add(newId);
    _prefs.setStringList(kFavAdsPref, favAds);
  }

  void removeFavBook(String removeId)async{
    _prefs = await SharedPreferences.getInstance();
    favAds.removeWhere((element) => element == removeId);
    _prefs.setStringList(kFavAdsPref, favAds);
  }

  void getFavAds()async{
    _prefs = await SharedPreferences.getInstance();
    favAds = _prefs.getStringList(kFavAdsPref) ?? [];
  }

  void fetchFavAds(String userAccessToken)async{
    emit(FetchFavAdsLoading());

   var results =  await _favAdsRepo.fetchFavAds(favAds, userAccessToken);
   results.fold((l) {
     emit(FetchFavAdsFailure(errorMessage: l.errorMessage));
   }, (r) {
     bookModelList = [];
     bookModelList = r;
     emit(FetchFavAdsSuccessfully());
   });
  }

}
