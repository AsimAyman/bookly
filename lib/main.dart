import 'package:book_extchange/bloc_observe.dart';
import 'package:book_extchange/core/routing/locator_service.dart';
import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/measures.dart';

import 'package:book_extchange/core/utils/theme.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/fav_ads/data/repos/fav_ads_repo.dart';
import 'package:book_extchange/features/fav_ads/view/view_models/fav_ads_cubit.dart';

import 'package:book_extchange/features/splash/view/view_models/splash_cubit/splash_cubit.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.sizeOf(context).width;
    deviceHeight = MediaQuery.sizeOf(context).height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(getIt.get<Dio>())),
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(
          create: (context) =>
          FavAdsCubit(getIt.get<FavAdsRepo>())..getFavAds(),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.router,
        title: 'Flutter Demo',
        theme: theme,
      ),
    );
  }
}
