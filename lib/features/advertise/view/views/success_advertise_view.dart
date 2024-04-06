import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/features/auth/view/views/widgets/custom_head_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessAdvertise extends StatelessWidget {
  const SuccessAdvertise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                children: [
                  SizedBox(height: deviceHeight * .1,),
                  Image.asset(
                    'assets/images/check_hand.png',
                    width: deviceWidth * .6,
                  ),
                  SizedBox(height: deviceHeight * .06,),
                  const CustomHeadText(txt: 'Congratulation'),
                  SizedBox(height: deviceHeight * .06,),
                  Text(
                    'Your ad has been posted successfully',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),

                ]),
              ),
              SliverFillRemaining(
                // hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    CustomMainButton(txt: 'Done', onTap: () {
                      GoRouter.of(context).pop();
                    }),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
