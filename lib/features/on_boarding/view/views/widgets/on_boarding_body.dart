import 'dart:async';

import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/features/on_boarding/data/models/on_board_content_model.dart';
import 'package:book_extchange/core/widgets/dot_indicator.dart';
import 'package:book_extchange/features/on_boarding/view/views/widgets/on_boarding_content.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  int _pageIndex = 0;
  final PageController _pageController = PageController();
  final List<OnBoardContentModel> _onBoardContents = [
    OnBoardContentModel(
      img: 'assets/images/welcome.svg',
      title: 'Welcome To Bookly',
      description: 'Your gateway to buying and selling used books.',
    ),
    OnBoardContentModel(
      img: 'assets/images/sell.svg',
      title: 'Sell Your Book',
      description: 'Easily sell your books and make another reader happy.',
    ),
    OnBoardContentModel(
      img: 'assets/images/buy.svg',
      title: 'Buy Used Books',
      description: 'Find and buy used books at great prices, all nearby.',
    ),
  ];
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_pageIndex < 2) {
        _pageIndex++;
      } else {
        GoRouter.of(context).pushReplacementNamed(Routes.kLoginView);
      }

      goNextPage();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: deviceHeight * 0.05,
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(onTap: () {
              navToLogin(context);
            },child: Text("Skip", style: Theme.of(context).textTheme.bodyMedium)),
          ),
          SizedBox(
            height: deviceHeight * 0.08,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _pageIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return OnBoardingContent(
                  onBoardContentModel: _onBoardContents[index],
                );
              },
              itemCount: _onBoardContents.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  _onBoardContents.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomMainButton(
            txt: _pageIndex == 2 ? "Start" : "Next",
            onTap: () {
              if(_pageIndex == 2){
                navToLogin(context);
              }else{
                goNextPage();
              }

            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  void navToLogin(BuildContext context) {
    GoRouter.of(context).pushReplacementNamed(Routes.kLoginView);
  }

  void goNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeIn,
    );
  }
}


