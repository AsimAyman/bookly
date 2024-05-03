part of 'google_books_cubit.dart';

@immutable
abstract class GoogleBooksState {}

class GoogleBooksInitial extends GoogleBooksState {}
class FetchGoogleBookLoading extends GoogleBooksState {}
class FetchGoogleBookSuccess extends GoogleBooksState {
  final List<GoogleBookModel> googleBooks;

  FetchGoogleBookSuccess({required this.googleBooks});

}
class FetchGoogleBookFailure extends GoogleBooksState {
  final String errorMessage;

  FetchGoogleBookFailure({required this.errorMessage});

}
