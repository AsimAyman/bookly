// ignore_for_file: empty_catches

import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/filter/data/repos/filter_repo/filter_repo.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FilterRepoImp extends FilterRepo {
  final Dio _dio;

  FilterRepoImp(this._dio);

  @override
  Future<Either<Failures, List<BookModel>>> filterAndFetchResults(
    String userToken,
    String govern,
    bool searchByPrice,
    List<String> price,
    bool isEducational,
    String subCategoryID,
  ) async {
    try {
      print({
        "city": govern == "All" ? "" : govern,
        "price": searchByPrice ? price : "",
        "category": isEducational ? ["17"] : ["$subCategoryID"],
        "sub_category": isEducational ? ["$subCategoryID"] : ""
      });

      var jsonData = await _dio.get("${ApiHandler.baseUrl}book",
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': "Bearer $userToken"
            },
          ),
          data: {
            "city": govern == "All" ? "" : govern,
            "price": searchByPrice ? price : "",
            "category": isEducational ? "17" : ["$subCategoryID"],
            "sub_category": isEducational ? ["$subCategoryID"] : ""
          });
      List<BookModel> bookModelList = [];
      for (var data in jsonData.data['data']) {
        try {
          bookModelList.add(BookModel.fromJson(data));
        } catch (e) {}
      }
      return right(bookModelList);
    } catch (e) {
      print(e);

      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }
}
