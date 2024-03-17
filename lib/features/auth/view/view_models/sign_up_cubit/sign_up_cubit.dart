

import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/auth/data/models/city_model.dart';
import 'package:book_extchange/features/auth/data/models/govern_model.dart';
import 'package:book_extchange/features/auth/data/repos/govern_repo/govern_repo.dart';

import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.governRepo}) : super(SignUpInitial());

  final GovernRepo governRepo;

  List<GovernModel> allGovs = [];
  List<CityModel> allCities = [];
  late GovernModel choosedGovern;
  late GovernModel choosedCity;

  void getGovs() async {
    allGovs = await governRepo.fetchAllGoverns();
    allGovs.forEach((element) {
      print(element.id);
      print(element.name);
    });
  }

  void getCities() async {
    allCities = await governRepo.fetchCitiesByGovernId(governId: '3');
    allCities.forEach((element) {
      print(element.id);
      print(element.name);
    });
  }

}
