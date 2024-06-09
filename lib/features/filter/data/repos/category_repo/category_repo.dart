import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/filter/data/models/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepo {
  Future<Either<Failures,List<CategoryModel>>> fetchGeneralCategories(String userToken);
  Future<Either<Failures,List<CategoryModel>>> fetchEducationalCategories(String userToken,);


}