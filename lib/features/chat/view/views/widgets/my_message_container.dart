import 'package:book_extchange/core/utils/measures.dart';
import 'package:flutter/material.dart';

class MyMessageContainer extends StatelessWidget {
  const MyMessageContainer({super.key,required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        constraints: BoxConstraints(maxWidth: deviceWidth * 0.8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: const Color(0xff000000).withOpacity(0.25)
              )
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "$txt",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
