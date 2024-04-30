//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SimilliarBooksListViewBuilder extends StatelessWidget {
//   const SimilliarBooksListViewBuilder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SimiliarBooksCubit, SimiliarBooksState>(
//       builder: (context, state) {
//         if (state is SimiliarBooksSucessfulState) {
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.18,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.only(right: 16),
//                   height: MediaQuery.of(context).size.height * 0.18,
//                   child: CustomBookImage(
//                     imageUrl: state.bookModelList[index].imageUrl,
//                   ),
//                 );
//               },
//               itemCount: state.bookModelList.length,
//             ),
//           );
//         } else if (state is SimiliarBooksLoadingState) {
//           return CustomLoadingWidget();
//         } else {
//           return CustomErrorWidget(
//               errorMessage: state is SimiliarBooksFailureState
//                   ? state.errorMessage
//                   : 'error');
//         }
//       },
//     );
//   }
// }
