
import 'package:book_extchange/features/auth/data/repos/govern_repo/govern_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){

  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<GovernRepoImp>(GovernRepoImp());


  // getIt.registerSingleton<LoginRepoImp>(LoginRepoImp(
  //   dio: getIt.get<Dio>(),
  // ));
}
