import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_center_loading_widget.dart';
import 'package:book_extchange/core/widgets/custom_no_ads_widget.dart';
import 'package:book_extchange/core/widgets/custom_simple_app_bar.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_books_list_view_home.dart';
import 'package:book_extchange/features/my_ads/view/view_models/my_ads_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAdsBody extends StatefulWidget {
  const MyAdsBody({super.key});

  @override
  State<MyAdsBody> createState() => _MyAdsBodyState();
}

class _MyAdsBodyState extends State<MyAdsBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MyAdsCubit>(context).fetchMyBooks(BlocProvider.of<LoginCubit>(context).userModel.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAdsCubit, MyAdsState>(
      listener: (context, state) {
        if(state is FetchMyAdsFailure){
           
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
                  myAds: true,
                          )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
