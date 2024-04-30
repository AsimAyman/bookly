import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/edit_book/data/repos/edit_book_repo.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/home/data/repos/books_repo/book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EditBookRepoImp extends EditBookRepo {
  final Dio _dio;

  EditBookRepoImp(this._dio);

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
        try {
          bookModelList.add(BookModel.fromJson(data));
        } catch (e) {}
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
  Future<Either<Failures, void>> editBook(
    String userToken,
    BookModel bookModel,
    String newTitle,
    String newPrice,
    String newDescription,
  ) async {
    try {

      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}book/update/${bookModel.id}",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
        data: {
          "title": newTitle,
          "description": newDescription,
          "city": bookModel.govern,
          "town": bookModel.city,
          "price": newPrice,
          "exchangable": bookModel.isExchangeable == 1 ? true : false,
          "negationable": bookModel.isNegotiable == 1 ? true : false,
          "state": true,
          "category_id": bookModel.category,
          "sub_category_id": bookModel.subCategory,
          "subject_id": "",
          "attachments":bookModel.imgsPath
        }
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
