part of 'fav_ads_cubit.dart';

@immutable
abstract class FavAdsState {}

class FavAdsInitial extends FavAdsState {}
class FavAdsLoading extends FavAdsState {}


class AddFavAdsSuccessfully extends FavAdsState {}
class AddFavAdsFailure extends FavAdsState {
  final String errorMessage;
  AddFavAdsFailure({required this.errorMessage});
}

class RemoveFavAdsSuccessfully extends FavAdsState {}
class RemoveFavAdsFailure extends FavAdsState {
  final String errorMessage;
  RemoveFavAdsFailure({required this.errorMessage});
}

class FetchFavAdsSuccessfully extends FavAdsState {}
class FetchFavAdsFailure extends FavAdsState {
  final String errorMessage;
  FetchFavAdsFailure({required this.errorMessage});
}
