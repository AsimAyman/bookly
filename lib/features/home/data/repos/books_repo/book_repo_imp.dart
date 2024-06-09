// ignore_for_file: empty_catches

import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_handler.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/books_repo/book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookRepoImp extends BookRepo {
  final Dio _dio;

  BookRepoImp(this._dio);

  @override
  Future<Either<Failures, List<BookModel>>> fetchallBooks(
      String userToken) async {
    try {
      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}book",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
      );
      List<BookModel> bookModelList = [];
      for (var data in jsonData.data['data']) {
        try{
          bookModelList.add(BookModel.fromJson(data));
        }catch(e){

        }
      }
      return right(bookModelList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchBooksByTitle(String userToken, String title)async {
    try {
      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}book",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
        data: {
          "title": title
        }
      );
      List<BookModel> bookModelList = [];
      for (var data in jsonData.data['data']) {
        try{
          bookModelList.add(BookModel.fromJson(data));
        }catch(e){

        }
      }
      return right(bookModelList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }
}
