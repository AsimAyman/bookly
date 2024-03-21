import 'package:book_extchange/core/widgets/dot_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselImages extends StatefulWidget {
  const CustomCarouselImages({
    super.key,
    required this.imgs,
  });

  final List<String> imgs;

  @override
  State<CustomCarouselImages> createState() => _CustomCarouselImagesState();
}

class _CustomCarouselImagesState extends State<CustomCarouselImages> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
            carouselController: carouselController,
            items: widget.imgs.map((e) {
              return AspectRatio(
                aspectRatio: 1.44,
                child: Image.asset(
                  e,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 1.44,
              // viewportFraction: 0.8,

              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              // enlargeCenterPage: true,
              // enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                  print(currentIndex);
                });
              },
              scrollDirection: Axis.horizontal,
            )),
        Positioned(
          bottom: 16,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                widget.imgs.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: DotIndicator(
                    isActive: index == currentIndex,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}