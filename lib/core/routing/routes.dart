import 'package:book_extchange/core/routing/navigation_animation.dart';
import 'package:book_extchange/features/auth/view/views/login_view.dart';
import 'package:book_extchange/features/auth/view/views/reset_password_view.dart';
import 'package:book_extchange/features/auth/view/views/sign_up_view.dart';
import 'package:book_extchange/features/book_details/view/views/book_details_view.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:book_extchange/features/home/view/views/home_view.dart';
import 'package:book_extchange/features/home/view/views/search_by_title_view.dart';
import 'package:book_extchange/features/home/view/views/widgets/search_by_title_body.dart';
import 'package:book_extchange/features/on_boarding/view/views/on_boarding_view.dart';
import 'package:book_extchange/features/profile/view/views/profile_view.dart';
import 'package:book_extchange/features/splash/view/views/splash_view.dart';

import 'package:go_router/go_router.dart';

abstract class Routes {
  static const kSplashView = 'splashView';
  static const kOnBoardingView = 'onBoardingView';
  static const kLoginView = 'LoginView';
  static const kSignUphView = 'SignUphView';
  static const kResetPasswordView = 'ResetPasswordView ';
  static const kHomeView = 'HomeView';
  static const kBookDetailsView = 'BookDetailsView';
  static const kSearchByTitleView = 'SearchByTitleView';
  static const kProfileView = 'ProfileView';


  static final router = GoRouter(routes: [
    GoRoute(
      name: kSplashView,
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: kOnBoardingView,
      path: '/onBoardingView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const OnBoardingView(),
            type: 'fade', // fade|rotation|scale|size|slide
          ),
    ),
    GoRoute(
      name: kLoginView,
      path: '/LoginView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const LoginView(),
            type: 'slide', // fade|rotation|scale|size|slide
          ),
    ),

    GoRoute(
      name: kSignUphView,
      path: '/SignUphView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const SignUpView(),
            type: 'fade', // fade|rotation|scale|size|slide
          ),
    ),
    GoRoute(
      name: kResetPasswordView,
      path: '/ResetPasswordView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const ResetPasswordView(),
            type: 'fade', // fade|rotation|scale|size|slide
          ),
    ),
    GoRoute(
      name: kHomeView,
      path: '/HomeView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const HomeView(),
            type: 'slide', // fade|rotation|scale|size|slide
          ),
    ),
    GoRoute(
      name: kSearchByTitleView,
      path: '/SearchByTitleView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const SearchByTitleView(),
            type: 'slide', // fade|rotation|scale|size|slide
          ),
    ),
    GoRoute(
        name: kBookDetailsView,
        path: '/BookDetailsView',
        pageBuilder: (context, state) {
          final book = state
              .extra as BookModel; // Ensure you handle potential type errors in real apps
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child:  BookDetailsView(bookModel: book,),
            type: 'slide', // fade|rotation|scale|size|slide
          );

        }

    ),

    GoRoute(
      name: kProfileView,
      path: '/ProfileView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const ProfileView(),
            type: 'slide', // fade|rotation|scale|size|slide
          ),
    ),


    // temp
    // GoRoute(
    //   name: kHomeView,
    //   path: '/homeView',
    //   pageBuilder: (context, state) =>
    //       RouterTransitionFactory.getTransitionPage(
    //     context: context,
    //     state: state,
    //     child: const HomeView(),
    //     type: 'fade', // fade|rotation|scale|size|slide
    //   ),
    // ),

  ]);
}
