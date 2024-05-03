// ignore_for_file: empty_catches

import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/my_ads/data/repos/my_ads_repo/my_ads_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MyAdsRepoImp extends MyAdsRepo {
  final Dio _dio;

  MyAdsRepoImp(this._dio);

  @override
  Future<Either<Failures, List<BookModel>>> fetchMyBooks(
      String userToken) async {
    try {
      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}book/my-ads",
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
  Future<Either<Failures, void>> deleteBook(String userToken, String bookId)async {
    try {
      var jsonData = await _dio.delete(
        "${ApiHandler.baseUrl}book/delete/$bookId",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
      );

      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }


}
