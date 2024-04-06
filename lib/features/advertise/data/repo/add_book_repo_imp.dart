import 'dart:io';

import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/advertise/data/repo/add_book_repo.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class AddBookRepoImp extends AddBookRepo {
  final Dio _dio;

  AddBookRepoImp(this._dio);

  @override
  Future<Either<Failures, void>> addNewBook(
      String userToken, BookModel bookModel, List<File> imgs) async {
    try {
      List<String> imgpaths = await uploadImages(userToken, imgs);
      print(imgpaths);
      var jsonData = await _dio.post("${ApiHandler.baseUrl}book/store",
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': "Bearer $userToken"
            },
          ),
          data: {
            "title": bookModel.title,
            "description": bookModel.description,
            "city": bookModel.govern,
            "town": bookModel.city,
            "price": double.parse (bookModel.price),
            "exchangable": bookModel.isExchangeable == 1 ? true : false,
            "negationable": bookModel.isNegotiable == 1 ? true : false,
            "state": true,
            "category_id": bookModel.category,
            "sub_category_id": bookModel.subCategory,
            "subject_id": "",
            "attachments": imgpaths
          });
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError(e.toString()));
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }

  Future<List<String>> uploadImages(String userToken, List<File> imgs) async {
    List<String> imagePaths = [];
    for (File img in imgs) {
      try {
        FormData formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(
            img.path,
            filename: img.path.split('/').last,
            contentType: MediaType('image','png')),
          "type":"image/png"
        });
        print(formData);
        var jsonData =
            await _dio.post("${ApiHandler.baseUrl}book/upload-attachment",
                options: Options(
                  headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'multipart/form-data',
                    'Authorization': "Bearer $userToken"
                  },
                ),
                data: formData);
        print(jsonData.data);
        imagePaths.add(jsonData.data['data']);
      } catch (e) {
        print("error in post image ${e.toString()}");
      }
    }
    return imagePaths;
  }
}
