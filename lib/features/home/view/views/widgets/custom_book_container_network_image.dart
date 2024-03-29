import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookContainerNetworkImage extends StatelessWidget {
  const CustomBookContainerNetworkImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 180,
      width: 150,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 180,
            width: 150,
            color: Colors.blue, // This color will be displayed after loading
          ),
        );
        // return Center(
        //   child: CircularProgressIndicator(
        //     value: loadingProgress.expectedTotalBytes != null
        //         ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
        //         : null,
        //   ),
        // );
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
    );
  }
}