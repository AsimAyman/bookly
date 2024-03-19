//
// import 'dart:convert';
//
// import 'package:book_extchange/features/auth/data/models/city_model.dart';
// import 'package:book_extchange/features/auth/data/models/govern_model.dart';
// import 'package:book_extchange/features/auth/data/repos/govern_repo/govern_repo.dart';
// import 'package:flutter/services.dart';
//
//
// class GovernRepoImp extends GovernRepo {
//
//    List<GovernModel> allGoverns = [];
//    List<CityModel> allCities = [];
//
//   List<CityModel> governCities = [];
//
//   @override
//   Future<void> fetchAllGoverns()async {
//     allGoverns = [];
//       final String response = await rootBundle.loadString('assets/gov_and_cities/governorates.json');
//       final data = await json.decode(response);
//       data.forEach((gov){
//         allGoverns.add(
//             GovernModel.fromJson(gov)
//         );
//       });
//   }
//
//   @override
//   Future<void> fetchAllCities() async{
//     allCities = [];
//       final String response = await rootBundle.loadString('assets/gov_and_cities/cities.json',);
//       final data = await json.decode(response);
//
//       data.forEach((gov){
//         allCities.add(
//             CityModel.fromJson(gov)
//         );
//       });
//
//
//   }
//
//   @override
//   Future<List<CityModel>> fetchCitiesByGovernId({required String governId})async {
//     governCities = [];
//     allCities.forEach((element) {
//       if(element.govId == governId){
//         governCities.add(element);
//       }
//     });
//     return governCities;
//   }
//
//
//
//
// }
