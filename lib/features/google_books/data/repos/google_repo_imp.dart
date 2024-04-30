import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/features/google_books/data/models/google_book_model.dart';
import 'package:book_extchange/features/google_books/data/repos/google_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class GoogleRepoImp extends GoogleRepo {
  final Dio _dio;

  GoogleRepoImp(this._dio);


  @override
  Future<Either<Failures, List<GoogleBookModel>>> fetchBooksByTitle(String title) async {
    try {
      var jsonData = await _dio.get("https://www.googleapis.com/books/v1/volumes?q=$title");
      List<GoogleBookModel> bookModelList = [];
      for (var data in jsonData.data['items']) {
        bookModelList.add(GoogleBookModel.fromJson(data));
      }
      return right(bookModelList);
    } catch (e) {
      if(e is DioException){
        return left(ServerSideError.fromDioException(e));
      }else{
        return left(ServerSideError(e.toString()));
      }
    }
  }


}
