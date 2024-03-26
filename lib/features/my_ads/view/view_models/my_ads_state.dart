part of 'my_ads_cubit.dart';

@immutable
abstract class MyAdsState {}

class MyAdsInitial extends MyAdsState {}
class FetchMyAdsLoading extends MyAdsState {}
class FetchMyAdsSuccessful extends MyAdsState {
  final List<BookModel> allBooks;

  FetchMyAdsSuccessful({required this.allBooks});
}
class FetchMyAdsFailure extends MyAdsState {
  final String errorMessage;

  FetchMyAdsFailure({required this.errorMessage});

}