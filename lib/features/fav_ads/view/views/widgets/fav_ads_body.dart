import 'package:book_extchange/core/widgets/custom_center_loading_widget.dart';
import 'package:book_extchange/core/widgets/custom_error_dialog.dart';
import 'package:book_extchange/core/widgets/custom_no_ads_widget.dart';
import 'package:book_extchange/core/widgets/custom_simple_app_bar.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/fav_ads/view/view_models/fav_ads_cubit.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_books_list_view_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavAdsBody extends StatefulWidget {
  const FavAdsBody({super.key});

  @override
  State<FavAdsBody> createState() => _FavAdsBodyState();
}

class _FavAdsBodyState extends State<FavAdsBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FavAdsCubit>(context).fetchFavAds(
        BlocProvider.of<LoginCubit>(context).userModel.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavAdsCubit, FavAdsState>(
      listener: (context, state) {
        if (state is FetchFavAdsFailure) {
          customErrorDialog(context,
              title: "Error", content: state.errorMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                children: [
                  const CustomSimpleAppBar(
                    txt: "Favoruites",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  state is FavAdsLoading
                      ? const CustomCenterLoadingWidget()
                      : state is FetchFavAdsSuccessfully
                          ? BlocProvider.of<FavAdsCubit>(context)
                                  .bookModelList
                                  .isEmpty
                              ? const CustomNoAdsWidget(
                                  txt:
                                      "You did not save any add yet try save one and back again",
                                )
                              : CustomBooksListViewHome(
                                  allBooks:
                                      BlocProvider.of<FavAdsCubit>(context)
                                          .bookModelList,
                                )
                          : state is AddFavAdsFailure ||
                                  state is RemoveFavAdsFailure ||
                                  state is FetchFavAdsFailure
                              ? const CustomNoAdsWidget(
                                  txt:
                                      "There is An Error Please Try Again Later",
                                )
                              : const CustomNoAdsWidget(
                                  txt:
                                      "You did not save any add yet try save one and back again",
                                ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
// const CustomNoAdsWidget(
// txt:
// "There is An Error Please Try Again Later",
// )

//"You did not save any add yet try save one and back again",
