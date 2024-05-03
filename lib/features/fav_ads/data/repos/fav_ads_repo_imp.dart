import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/fav_ads/data/repos/fav_ads_repo.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FavAdsRepoImp extends FavAdsRepo {
  final Dio _dio;

  FavAdsRepoImp(this._dio);

  @override
  Future<Either<Failures, List<BookModel>>> fetchFavAds(String userToken)async {
    try {

      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}favorite-books",
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
  Future<Either<Failures, void>> addFavAd(String bookId,String userToken)async {
    try {

      var jsonData = await _dio.post(
          "${ApiHandler.baseUrl}book/add-to-favorite/$bookId",
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

  @override
  Future<Either<Failures, void>> removeFavAd(String bookId,String userToken) async {
    try {

      var jsonData = await _dio.delete(
        "${ApiHandler.baseUrl}book/delete-from-favorite/$bookId",
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
