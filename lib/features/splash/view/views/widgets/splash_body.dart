
import 'package:Bookly/core/utils/measures.dart';
import 'package:Bookly/features/splash/view/view_models/splash_cubit/splash_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).startNav(context);

  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Image.asset(
        'assets/images/Bookly_blue.png',
        width: deviceWidth,
      ),
    );
  }
}
