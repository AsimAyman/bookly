// ignore_for_file: empty_catches, depend_on_referenced_packages

import 'dart:io';

import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_handler.dart';
import 'package:bookly/features/advertise/data/repo/add_book_repo.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class AddBookRepoImp extends AddBookRepo {
  final Dio _dio;

  AddBookRepoImp(this._dio);

  @override
  Future<Either<Failures, void>> addNewBook(
      String userToken, BookModel bookModel, List<File> imgs) async {
    print("##start##");
    print("""
                data: {
            "title": bookModel.title,
            "description": bookModel.description,
            "city": bookModel.govern,
            "town": bookModel.city,
            "price": double.parse (bookModel.price),
            "exchangable": bookModel.isExchangeable == 1 ? true : false,
            "negationable": bookModel.isNegotiable == 1 ? true : false,
            "state": true,
            "category_id": ${bookModel.category},
            "sub_category_id": ${bookModel.subCategory},
            "subject_id": "",
            "attachments": imgpaths
          });
      """);
    try {
      List<String> imgpaths = await uploadImages(userToken, imgs);



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
         
        imagePaths.add(jsonData.data['data']);
      } catch (e) {
         
      }
    }
    return imagePaths;
  }
}
