import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/features/filter/data/models/category_model.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';

import 'package:dartz/dartz.dart';

abstract class FavAdsRepo {
  Future<Either<Failures, List<BookModel>>> fetchFavAds(List<String> Ids, String userToken);
}
