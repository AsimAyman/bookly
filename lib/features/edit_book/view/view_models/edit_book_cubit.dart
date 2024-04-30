import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'edit_book_state.dart';

class EditBookCubit extends Cubit<EditBookState> {
  EditBookCubit() : super(EditBookInitial());
  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController priceEditingController = TextEditingController();
  final TextEditingController descriptionEditingController = TextEditingController();

  void editBook(BookModel bookModel)async{
  print(bookModel.category);
  print(bookModel.subCategory);

  }

}
