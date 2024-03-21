import 'package:book_extchange/core/utils/measures.dart';

import 'package:book_extchange/features/book_details/view/views/widgets/back_button.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_button_icon_text.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_carousel_images.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_description_text.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_fav_button.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_price_and_city.dart';


import 'package:flutter/material.dart';


class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth,
      height: deviceHeight,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Stack(
                  children: [
                    CustomCarouselImages(
                      imgs: [
                        "assets/images/book_cover_1.jpg",
                        "assets/images/book_cover_1.jpg",
                        "assets/images/book_cover_1.jpg",
                        "assets/images/book_cover_1.jpg"
                      ],
                    ),
                    CustomBackButton(),
                    FavButton(),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Spring Book From png Tree with good You can buy it now",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Divider(
                        height: 32,
                      ),
                      const CustomPriceAndCity(),
                      const Divider(
                        height: 32,
                      ),
                      const CustomDescriptionText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomButtonIconText(
                    txt: "Phone",
                    iconData: Icons.phone,
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomButtonIconText(
                    txt: "Chat",
                    iconData: Icons.sms,
                    isBackPrimary: false,
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
