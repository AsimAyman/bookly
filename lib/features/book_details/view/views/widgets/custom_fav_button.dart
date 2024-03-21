import 'package:flutter/material.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 16,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Center(
          child: Icon(
            Icons.favorite_border,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}