import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class FavAdsRepo {
  Future<Either<Failures, List<BookModel>>> fetchFavAds(String userToken);
  Future<Either<Failures, void>> addFavAd(String bookId,String userToken);
  Future<Either<Failures, void>> removeFavAd(String bookId,String userToken);


}
