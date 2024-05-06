import 'package:Bookly/core/errors/failures.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class MyAdsRepo {
  Future<Either<Failures,List<BookModel>>> fetchMyBooks(String userToken);
  Future<Either<Failures,void>> deleteBook(String userToken , String bookId);



}