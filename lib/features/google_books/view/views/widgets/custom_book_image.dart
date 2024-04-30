
import 'package:book_extchange/core/utils/assets_handler.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 0.6696,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl ?? AssetsHandler.backgroundBookCoverPlaceholder,
          placeholder: (context, url) {
            return const Center(child: CircularProgressIndicator(),);
          },
          fadeInDuration: const Duration(seconds: 2),
          errorWidget: (context, url, error) {
            return const Center(child: Icon(Icons.error),);
          },
        ),
      ),
    );
  }
}
/*
Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image:  DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              imageUrl ?? AssetsHandler.backgroundBookCoverPlaceholder,
            ),
          ),
        ),
      )
 */
