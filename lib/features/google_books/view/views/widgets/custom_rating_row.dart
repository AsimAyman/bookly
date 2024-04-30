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
        Icon(Icons.star,color: Colors.yellow,),
        SizedBox(width: 5,),
        Text(averageRating.toString(),style: StylesHandler.textStyle16Bold,),
        SizedBox(width: 5,),
        Text(ratingsCount.toString(),style: StylesHandler.textStyle14,),
        SizedBox(width: 5,),
      ],
    );
  }
}
