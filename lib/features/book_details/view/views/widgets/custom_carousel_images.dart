import 'package:book_extchange/core/widgets/dot_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselImages extends StatefulWidget {
  const CustomCarouselImages({
    super.key,
    required this.imgs,
  });

  final List<dynamic> imgs;

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
                child: Image.network(
                  e,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/images/error_load_image.png",
                      height: 180,
                      width: 150,
                      fit: BoxFit.fill,);
                  },
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