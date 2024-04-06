part of 'fav_ads_cubit.dart';

@immutable
abstract class FavAdsState {}

class FavAdsInitial extends FavAdsState {}
class FetchFavAdsLoading extends FavAdsState {}
class FetchFavAdsSuccessfully extends FavAdsState {}

class FetchFavAdsFailure extends FavAdsState {
  final String errorMessage;
  FetchFavAdsFailure({required this.errorMessage});
}
