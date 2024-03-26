part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeFetchDataLoading extends HomeState {}
class HomeFetchDataSuccessful extends HomeState {
  final List<BookModel> allBooks;

  HomeFetchDataSuccessful({required this.allBooks});
}
class HomeFetchDataFailure extends HomeState {
  final String errorMessage;

  HomeFetchDataFailure({required this.errorMessage});

}