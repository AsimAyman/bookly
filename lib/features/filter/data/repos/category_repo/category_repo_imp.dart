// ignore_for_file: empty_catches

import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/filter/data/models/category_model.dart';
import 'package:book_extchange/features/filter/data/repos/category_repo/category_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryRepoImp extends CategoryRepo {
  final Dio _dio;

  CategoryRepoImp(this._dio);


  @override
  Future<Either<Failures, List<CategoryModel>>> fetchGeneralCategories(String userToken) async{
    try {
      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}general-categories",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
      );
      List<CategoryModel> categoryList = [];
      for (var data in jsonData.data['data']) {
        try{
          categoryList.add(CategoryModel.fromJson(data));
        }catch(e){
        }
      }
      return right(categoryList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<CategoryModel>>>fetchEducationalCategories (String userToken) async {
    try {
      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}educational-sub-categories?category_id=17",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
      );
      List<CategoryModel> categoryList = [];
      for (var data in jsonData.data['data']) {
        try{
          categoryList.add(CategoryModel.fromJson(data));
        }catch(e){
        }
      }
      return right(categoryList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }
}
