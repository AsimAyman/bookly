import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';


class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var loginCubit = BlocProvider.of<LoginCubit>(context);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loginCubit.userModel.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    loginCubit.userModel.email,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: const Text('Profile'),
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.kProfileView);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add,
            ),
            title: const Text('Advertise you book'),
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.kAdvertiseView);
            },
          ),

          Spacer(),
          ListTile(
            leading: Transform.rotate(
              angle: 180 * math.pi / 180,
              child: Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
            title: const Text('Logout'),
            onTap: () {
              loginCubit.logout();
              GoRouter.of(context).pushReplacementNamed(Routes.kLoginView);

            },
          ),
        ],
      ),
    );
  }
}
