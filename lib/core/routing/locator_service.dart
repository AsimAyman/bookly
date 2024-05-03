import 'package:book_extchange/features/advertise/data/repo/add_book_repo.dart';
import 'package:book_extchange/features/advertise/data/repo/add_book_repo_imp.dart';
import 'package:book_extchange/features/chat/data/repos/chat_repo.dart';
import 'package:book_extchange/features/chat/data/repos/chat_repo_imp.dart';
import 'package:book_extchange/features/edit_book/data/repos/edit_book_repo.dart';
import 'package:book_extchange/features/edit_book/data/repos/edit_book_repo_imp.dart';
import 'package:book_extchange/features/fav_ads/data/repos/fav_ads_repo.dart';
import 'package:book_extchange/features/fav_ads/data/repos/fav_ads_repo_imp.dart';
import 'package:book_extchange/features/filter/data/repos/category_repo/category_repo.dart';
import 'package:book_extchange/features/filter/data/repos/category_repo/category_repo_imp.dart';
import 'package:book_extchange/features/filter/data/repos/filter_repo/filter_repo.dart';
import 'package:book_extchange/features/filter/data/repos/filter_repo/filter_repo_imp.dart';
import 'package:book_extchange/features/google_books/data/repos/google_repo.dart';
import 'package:book_extchange/features/google_books/data/repos/google_repo_imp.dart';
import 'package:book_extchange/features/home/data/repos/books_repo/book_repo.dart';
import 'package:book_extchange/features/home/data/repos/books_repo/book_repo_imp.dart';
import 'package:book_extchange/features/my_ads/data/repos/my_ads_repo/my_ads_repo.dart';
import 'package:book_extchange/features/my_ads/data/repos/my_ads_repo/my_ads_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<BookRepo>(BookRepoImp(getIt.get<Dio>()));
  getIt.registerSingleton<MyAdsRepo>(MyAdsRepoImp(getIt.get<Dio>()));
  getIt.registerSingleton<CategoryRepo>(CategoryRepoImp(getIt.get<Dio>()));
  getIt.registerSingleton<FilterRepo>(FilterRepoImp(getIt.get<Dio>()));
  getIt.registerSingleton<FavAdsRepo>(FavAdsRepoImp(getIt.get<Dio>()));
  getIt.registerSingleton<AddBookRepo>(AddBookRepoImp(getIt.get<Dio>()));
  getIt.registerSingleton<ChatRepo>(ChatRepoImp(getIt.get<Dio>()));
  getIt.registerSingleton<EditBookRepo>(EditBookRepoImp(getIt.get<Dio>()));

  getIt.registerSingleton<GoogleRepo>(GoogleRepoImp(getIt.get<Dio>()));

  // getIt.registerSingleton<LoginRepoImp>(LoginRepoImp(
  //   dio: getIt.get<Dio>(),
  // ));
}
