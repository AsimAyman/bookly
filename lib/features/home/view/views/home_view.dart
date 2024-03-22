import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/home/view/view_models/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_home_drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              print(BlocProvider.of<LoginCubit>(context).isSignedIn);
              print(BlocProvider.of<LoginCubit>(context).userModel.id);
              print(BlocProvider.of<LoginCubit>(context).userModel.name);
              print(BlocProvider.of<LoginCubit>(context).userModel.email);
              print(BlocProvider.of<LoginCubit>(context).userModel.mobileNumber);
              print(BlocProvider.of<LoginCubit>(context).userModel.accessToken);

            },),
            backgroundColor: Colors.white,
            key: BlocProvider.of<BottomNavCubit>(context).scaffoldKey,
            drawer: CustomHomeDrawer(),
            bottomNavigationBar: Container(
              color: Theme.of(context).colorScheme.background,
              padding: const EdgeInsets.all(15),
              child: GNav(
                activeColor: Colors.white,
                color: Colors.black,
                tabBackgroundColor: Theme.of(context).colorScheme.primary,
                gap: 8,
                padding: const EdgeInsets.all(16),
                selectedIndex:
                    BlocProvider.of<BottomNavCubit>(context).selectedIndex,
                onTabChange: (value) {
                  BlocProvider.of<BottomNavCubit>(context).onTapChange(value);
                },
                tabs: [
                  GButton(
                    icon: BlocProvider.of<BottomNavCubit>(context)
                                .selectedIndex ==
                            0
                        ? Icons.home
                        : Icons.home_outlined,
                    text: "Home",
                  ),
                  GButton(
                    icon: BlocProvider.of<BottomNavCubit>(context)
                                .selectedIndex ==
                            1
                        ? Icons.chat_bubble
                        : Icons.chat_bubble_outline,
                    text: "Chat",
                  ),
                  GButton(
                    icon: BlocProvider.of<BottomNavCubit>(context)
                                .selectedIndex ==
                            2
                        ? Icons.settings_accessibility
                        : Icons.settings_accessibility,
                    text: "My Ads",
                  ),
                  GButton(
                    icon: BlocProvider.of<BottomNavCubit>(context)
                                .selectedIndex ==
                            3
                        ? Icons.favorite
                        : Icons.favorite_border,
                    text: "Favourite",
                  ),
                ],
              ),
            ),
            body: BlocProvider.of<BottomNavCubit>(context).bottomNavBodies[
                BlocProvider.of<BottomNavCubit>(context).selectedIndex],
          );
        },
      ),
    );
  }
}

