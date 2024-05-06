import 'package:Bookly/core/routing/navigation_animation.dart';
import 'package:Bookly/features/advertise/view/views/advertise_view.dart';
import 'package:Bookly/features/advertise/view/views/success_advertise_view.dart';
import 'package:Bookly/features/auth/view/views/login_view.dart';
import 'package:Bookly/features/auth/view/views/reset_password_view.dart';
import 'package:Bookly/features/auth/view/views/sign_up_view.dart';
import 'package:Bookly/features/book_details/view/views/book_details_view.dart';
import 'package:Bookly/features/chat/view/views/chat_detials_view.dart';
import 'package:Bookly/features/edit_book/view/views/edit_book_view.dart';
import 'package:Bookly/features/filter/view/views/filter_results_view.dart';
import 'package:Bookly/features/filter/view/views/filter_view.dart';
import 'package:Bookly/features/google_books/data/models/google_book_model.dart';
import 'package:Bookly/features/google_books/view/views/google_book_details_view.dart';
import 'package:Bookly/features/google_books/view/views/google_search_view.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:Bookly/features/home/view/views/home_view.dart';
import 'package:Bookly/features/home/view/views/search_by_title_view.dart';
import 'package:Bookly/features/on_boarding/view/views/on_boarding_view.dart';
import 'package:Bookly/features/profile/view/views/profile_view.dart';
import 'package:Bookly/features/splash/view/views/splash_view.dart';
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
  static const kFilterView = 'FilterView';
  static const kFilterResultsView = 'FilterResultsView';
  static const kProfileView = 'ProfileView';
  static const kAdvertiseView = 'AdvertiseView';
  static const kSuccessAdvertiseView = 'SuccessAdvertiseView';
  static const kEditBookView = 'EditBookView';
  static const kChatDetailsView = 'ChatDetailsView';

  static const kGoogleBookSearchView = 'GoogleBookSearchView ';
  static const kGoogleBooksDetails = 'GoogleBooksDetails';

  static final router = GoRouter(routes: [
    GoRoute(
      name: kSplashView,
      path: '/',
      // path: '/a',
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
      name: kFilterView,
      path: '/FilterView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
        context: context,
        state: state,
        child: const FilterView(),
        type: 'slide', // fade|rotation|scale|size|slide
      ),
    ),
    //FilterViewBody
    GoRoute(
        name: kFilterResultsView,
        path: '/FilterResultsView',
        pageBuilder: (context, state) {
          final books = state.extra as List<BookModel>;
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: FilterResultsView(
              books: books,
            ),
            type: 'slide', // fade|rotation|scale|size|slide
          );
        }),
    GoRoute(
        name: kBookDetailsView,
        path: '/BookDetailsView',
        pageBuilder: (context, state) {
          final book = state.extra
              as BookModel; // Ensure you handle potential type errors in real apps
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: BookDetailsView(
              bookModel: book,
            ),
            type: 'slide', // fade|rotation|scale|size|slide
          );
        }),

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
    GoRoute(
      name: kAdvertiseView,
      path: '/AdvertiseView',
      // path: '/',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
        context: context,
        state: state,
        child: const AdvertiseView(),
        type: 'slide', // fade|rotation|scale|size|slide
      ),
    ),
    GoRoute(
      name: kSuccessAdvertiseView,
      path: '/SuccessAdvertiseView',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
        context: context,
        state: state,
        child: const SuccessAdvertise(),
        type: 'scale', // fade|rotation|scale|size|slide
      ),
    ),
    GoRoute(
        name: kEditBookView,
        path: '/EditBookView',
        pageBuilder: (context, state) {
          final book = state.extra as BookModel; // E
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: EditBookView(
              bookModel: book,
            ),
            type: 'scale', // fade|rotation|scale|size|slide
          ); // nsure you handle potential type errors in real apps
        }),
    GoRoute(
        name: kChatDetailsView,
        path: '/ChatDetailsView',
        pageBuilder: (context, state) {
          final int chatRoomId = state.extra as int;
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: ChatDetailsView(
              id: chatRoomId,
            ),
            type: 'scale', // fade|rotation|scale|size|slide
          );
        }),

    /*
      static const kGoogleBookSearchView = 'GoogleBookSearchView ';
  static const kGoogleBooksDetails = 'GoogleBooksDetails';
     */
    GoRoute(
        name: kGoogleBookSearchView,
        path: '/GoogleBookSearchView',
        pageBuilder: (context, state) {
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const GoogleSearchView(),
            type: 'scale', // fade|rotation|scale|size|slide
          );
        }),
    GoRoute(
        name: kGoogleBooksDetails,
        path: '/GoogleBooksDetails',
        pageBuilder: (context, state) {
          final GoogleBookModel googleBookModel =
              state.extra as GoogleBookModel;
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: GoogleBookDetailsView(
              bookModel: googleBookModel,
            ),
            type: 'scale', // fade|rotation|scale|size|slide
          );
        }),
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
