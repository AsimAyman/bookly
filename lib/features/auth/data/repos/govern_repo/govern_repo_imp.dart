
import 'dart:convert';

import 'package:book_extchange/features/auth/data/models/city_model.dart';
import 'package:book_extchange/features/auth/data/models/govern_model.dart';
import 'package:book_extchange/features/auth/data/repos/govern_repo/govern_repo.dart';
import 'package:flutter/services.dart';


class GovernRepoImp extends GovernRepo {


  @override
  Future<List<GovernModel>> fetchAllGoverns()async {

    List<GovernModel> allGoverns = [];
    final String response = await rootBundle.loadString('assets/gov_and_cities/governorates.json');
    final data = await json.decode(response);
    data.forEach((gov){
      allGoverns.add(
        GovernModel.fromJson(gov)
      );
    });

    return allGoverns;
  }

  @override
  Future<List<CityModel>> fetchCitiesByGovernId({required String governId})async {
    List<CityModel> allCities = [];

    final String response = await rootBundle.loadString('assets/gov_and_cities/cities.json',);
    final data = await json.decode(response);

    data.forEach((gov){
      if(gov['governorate_id'] == governId){
        allCities.add(
            CityModel.fromJson(gov)
        );
      }
    });

    return allCities;
  }


}
