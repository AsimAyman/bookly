import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class EditBookRepo {
  Future<Either<Failures,void>> editBook(String userToken , BookModel bookModel , String newTitle, String newPrice, String newDescription,);
}