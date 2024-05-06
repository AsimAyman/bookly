// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:Bookly/features/chat/view/views/chat_rooms_body.dart';
import 'package:Bookly/features/fav_ads/view/views/widgets/fav_ads_body.dart';
import 'package:Bookly/features/home/view/views/widgets/home_body.dart';
import 'package:Bookly/features/my_ads/view/views/my_ads_body.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key

  List<Widget> bottomNavBodies = const [
    HomeBody(),
    ChatRoomsBody(),
    MyAdsBody(),
    FavAdsBody()
  ];

  void onTapChange(int newIndex){
    selectedIndex = newIndex;
    emit(BottomNavChanged());
     
  }
}
