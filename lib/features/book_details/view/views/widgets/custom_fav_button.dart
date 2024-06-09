import 'package:bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:bookly/features/fav_ads/view/view_models/fav_ads_cubit.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavButton extends StatefulWidget {
  const FavButton({
    super.key, required this.bookModel,
  });
  final BookModel bookModel;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {


  bool isFav = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(BookModel book in BlocProvider.of<FavAdsCubit>(context).bookModelList){
      if(widget.bookModel.id.toString() == book.id.toString()){
        isFav = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String userAccessToken = BlocProvider.of<LoginCubit>(context).userModel.accessToken;
    var favAdsCubit = BlocProvider.of<FavAdsCubit>(context);

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
                  favAdsCubit.removeFavBook(widget.bookModel.id.toString() , userAccessToken);
                  isFav = false;
                }
                else{
                  favAdsCubit.addNewFavBook(widget.bookModel , userAccessToken);
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