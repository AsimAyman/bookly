import 'package:book_extchange/core/routing/locator_service.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_center_loading_widget.dart';
import 'package:book_extchange/core/widgets/custom_no_ads_widget.dart';
import 'package:book_extchange/core/widgets/custom_simple_app_bar.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_books_list_view_home.dart';
import 'package:book_extchange/features/my_ads/data/repos/my_ads_repo/my_ads_repo.dart';
import 'package:book_extchange/features/my_ads/view/view_models/my_ads_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAdsBody extends StatelessWidget {
  const MyAdsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAdsCubit(getIt.get<MyAdsRepo>())..fetchMyBooks(context),
      child: BlocConsumer<MyAdsCubit, MyAdsState>(
        listener: (context, state) {
          if(state is FetchMyAdsFailure){
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const CustomSimpleAppBar(
                    txt: "My Ads",
                  ),
                  SizedBox(
                    height: 36,
                  ),

                  //loading
                  state is FetchMyAdsLoading
                      ? Expanded(child: const CustomCenterLoadingWidget())
                      : const SizedBox(),

                  //successful
                  state is FetchMyAdsSuccessful
                      ? state.allBooks.isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                  height: deviceHeight * 0.15,
                                ),
                                const CustomNoAdsWidget(
                                  txt:
                                      "You did not add any add yet try add one and back again",
                                )
                              ],
                            )
                          : CustomBooksListViewHome(
                              allBooks: state.allBooks,
                            )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
