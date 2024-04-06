import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/fav_ads/data/repos/fav_ads_repo.dart';
import 'package:book_extchange/features/filter/data/models/category_model.dart';
import 'package:book_extchange/features/filter/data/repos/category_repo/category_repo.dart';
import 'package:book_extchange/features/filter/data/repos/filter_repo/filter_repo.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/home/data/repos/books_repo/book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FavAdsRepoImp extends FavAdsRepo {
  final Dio _dio;

  FavAdsRepoImp(this._dio);

  @override
  Future<Either<Failures, List<BookModel>>> fetchFavAds(
      List<String> Ids, String userToken) async {
    List<BookModel> bookModelList = [];
    try {
      for (String id in Ids) {
        print(id);
        try {
          var jsonData = await _dio.get(
            "${ApiHandler.baseUrl}book/$id",
            options: Options(
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': "Bearer $userToken"
              },
            ),
          );
          try {
            bookModelList.add(BookModel.fromJson(jsonData.data['data']));
          } catch (e) {}
        } catch (e) {

        }
      }
      return right(bookModelList);
    }catch(e){
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }

  }
}
