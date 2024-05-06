// import 'package:Bookly/core/routing/locator_service.dart';
// import 'package:Bookly/features/fav_ads/data/repos/fav_ads_repo.dart';
// import 'package:Bookly/features/fav_ads/view/view_models/fav_ads_cubit.dart';
// import 'package:Bookly/features/fav_ads/view/views/widgets/fav_ads_body.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class FavAdsView extends StatelessWidget {
//   const FavAdsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FavAdsCubit(getIt.get<FavAdsRepo>()),
//       child:  Scaffold(
//         body: BlocConsumer<FavAdsCubit, FavAdsState>(
//           listener: (context, state) {
//             // TODO: implement listener
//           },
//           builder: (context, state) {
//             return const FavAdsBody();
//           },
//         ),
//       ),
//     );
//   }
// }
