
import 'package:book_extchange/features/home/view/view_models/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_book_container.dart';
import 'package:book_extchange/features/home/view/views/widgets/custom_search_and_filter_bar.dart';
import 'package:book_extchange/features/home/view/views/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            HomeAppBar(
              onTap: () {
                BlocProvider.of<BottomNavCubit>(context)
                    .scaffoldKey
                    .currentState!
                    .openDrawer();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomSearchAndFilterBar(),
            const SizedBox(
              height: 24,
            ),
            const CustomBookContainer(),
            const SizedBox(
              height: 16,
            ),

            const CustomBookContainer(),
          ],
        ),
      ),
    );
  }
}


