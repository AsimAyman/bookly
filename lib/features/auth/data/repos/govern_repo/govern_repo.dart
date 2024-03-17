import 'package:book_extchange/features/auth/data/models/city_model.dart';
import 'package:book_extchange/features/auth/data/models/govern_model.dart';


abstract class GovernRepo {
  Future<List<GovernModel>> fetchAllGoverns();
  Future<List<CityModel>> fetchCitiesByGovernId({required String governId});

}