import 'package:Bookly/core/utils/measures.dart';
import 'package:Bookly/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:flutter/material.dart';
class ImageAdder extends StatelessWidget {
 const ImageAdder({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
        AdvertiseCubit.get(context).takeImage,
      borderRadius: borderRadius,
      child: Container(
        margin: const EdgeInsets.all(16),
        height: deviceHeight * .3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.black45),
          borderRadius: borderRadius,
        ),
        child:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline_rounded, // Replace with your desired icon
              size: 32,
              color: Colors.black45,
            ),
            SizedBox(width: 8),
            Text(
              "Add New Image",
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}