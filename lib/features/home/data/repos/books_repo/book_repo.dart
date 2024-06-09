import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepo {
  Future<Either<Failures,List<BookModel>>> fetchallBooks(String userToken);
  Future<Either<Failures,List<BookModel>>> fetchBooksByTitle(String userToken,String title);


}