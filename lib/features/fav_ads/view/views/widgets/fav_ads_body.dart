import 'package:book_extchange/core/widgets/custom_no_ads_widget.dart';
import 'package:book_extchange/core/widgets/custom_simple_app_bar.dart';
import 'package:flutter/material.dart';

class FavAdsBody extends StatelessWidget {
  const FavAdsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Center(
        child: Column(
          children: [
            CustomSimpleAppBar(txt: "Favoruites",),
            CustomNoAdsWidget(
              txt: "You did not save any add yet try save one and back again",
            ),
          ],
        ),
      ),
    );
  }
}

