import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/features/filter/data/models/category_model.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';

import 'package:dartz/dartz.dart';

abstract class FilterRepo {
  Future<Either<Failures, List<BookModel>>> filterAndFetchResults(
    String userToken,
    String govern,
    bool searchByPrice,
    List<String> price,
    bool isEducational,
    String subCategoryID,
  );
}
