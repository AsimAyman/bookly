import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:book_extchange/features/home/view/view_models/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:book_extchange/features/home/view/views/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
   HomeBody({super.key});

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
            HomeAppBar(onTap: () {
              BlocProvider.of<BottomNavCubit>(context).scaffoldKey.currentState!.openDrawer();
            },),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                        const SizedBox(width: 16,),
                        const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8,),
                        Text(
                          "Search for Book",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16,),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: const Center(
                    child: Icon(Icons.filter_list,color: Colors.white,size: 30,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

