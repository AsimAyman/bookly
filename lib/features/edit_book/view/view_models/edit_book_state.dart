part of 'edit_book_cubit.dart';

@immutable
abstract class EditBookState {}

class EditBookInitial extends EditBookState {}

class EditBookLoading extends EditBookState {}
class EditBookSuccessful extends EditBookState {}
class EditBookFailure extends EditBookState {
  final String errorMessage;

  EditBookFailure({required this.errorMessage});

}
