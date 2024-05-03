import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/edit_book/data/repos/edit_book_repo.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

part 'edit_book_state.dart';

class EditBookCubit extends Cubit<EditBookState> {
  EditBookCubit(this._editBookRepo) : super(EditBookInitial());
  EditBookRepo _editBookRepo;
   TextEditingController titleEditingController = TextEditingController();
   TextEditingController priceEditingController = TextEditingController();
   TextEditingController descriptionEditingController = TextEditingController();

  void editBook(BookModel bookModel, String userToken)async{
    emit(EditBookLoading());
    var results = await _editBookRepo.editBook(userToken, bookModel, titleEditingController.text, priceEditingController.text, descriptionEditingController.text);
    results.fold((l) {
      emit(EditBookFailure(errorMessage: l.errorMessage));
    }, (r) {

      emit(EditBookSuccessful());
    });

  }

}
