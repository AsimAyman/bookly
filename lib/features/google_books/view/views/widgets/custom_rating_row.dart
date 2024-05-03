import 'package:book_extchange/core/utils/stylies_handler.dart';
import 'package:flutter/material.dart';

class CustomRatingRow extends StatelessWidget {
  const CustomRatingRow({super.key , required this.averageRating , required this.ratingsCount});
  final double averageRating;
  final int ratingsCount;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star,color: Colors.yellow,),
        const SizedBox(width: 5,),
        Text(averageRating.toString(),style: StylesHandler.textStyle16Bold,),
        const SizedBox(width: 5,),
        Text(ratingsCount.toString(),style: StylesHandler.textStyle14,),
        const SizedBox(width: 5,),
      ],
    );
  }
}
