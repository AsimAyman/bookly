import 'dart:io';

import 'package:Bookly/core/utils/measures.dart';
import 'package:Bookly/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:Bookly/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ImageDisplay extends StatefulWidget{
 const ImageDisplay({required this.image ,super.key});
  final File image;

  @override
  State<ImageDisplay> createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvertiseCubit,AdvertiseState>(
      listener: (context, state) => {},
      builder: (context, state) =>
       Dismissible (
        key: Key(widget.image.path),
        onDismissed: (_)=> AdvertiseCubit.get(context).deleteImage(widget.image) ,
       child:
        InkWell(
            onTap: ()=>
              AdvertiseCubit.get(context).editImage(widget.image),
          borderRadius: borderRadius,
          child: Container(
            margin: const EdgeInsets.all(16),
            height: deviceHeight * .3,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Image.file(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
       ),
      ),
    );
  }
}
