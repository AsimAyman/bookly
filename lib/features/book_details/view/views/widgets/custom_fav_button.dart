import 'package:book_extchange/features/fav_ads/view/view_models/fav_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavButton extends StatefulWidget {
  const FavButton({
    super.key, required this.bookId,
  });
  final String bookId;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    var favAdsCubit = BlocProvider.of<FavAdsCubit>(context);
    bool isFav = favAdsCubit.favAds.contains(widget.bookId);
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
          child: GestureDetector(
            onTap: () {
              setState(() {
                if(isFav){
                  favAdsCubit.removeFavBook(widget.bookId);
                  isFav = false;
                }
                else{
                  favAdsCubit.addNewFavBook(widget.bookId);
                  isFav = true;
                }
              });

            },
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}