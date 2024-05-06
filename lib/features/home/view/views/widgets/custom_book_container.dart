import 'package:Bookly/core/routing/routes.dart';
import 'package:Bookly/core/utils/measures.dart';
import 'package:Bookly/core/utils/theme.dart';
import 'package:Bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:Bookly/features/home/view/views/widgets/custom_book_container_network_image.dart';
import 'package:Bookly/features/my_ads/view/view_models/my_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBookContainer extends StatelessWidget {
  const CustomBookContainer(
      {super.key, required this.bookModel, this.myAd = false});

  final BookModel bookModel;
  final bool myAd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .pushNamed(Routes.kBookDetailsView, extra: bookModel);
          },
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorsHandler.kGrey1,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.2))
                ]),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: CustomBookContainerNetworkImage(
                      image: bookModel.imgsPath[0]),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      bookModel.price,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: deviceWidth - 220,
                      child: Text(
                        bookModel.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Spacer(),
                    Text(bookModel.govern,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        myAd ? CustomEditAndDeleteMyBook(bookModel: bookModel,) : const SizedBox()
      ],
    );
  }
}

class CustomEditAndDeleteMyBook extends StatelessWidget {
  const CustomEditAndDeleteMyBook({
    super.key,
    required this.bookModel
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.kEditBookView,extra: bookModel);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Edit",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _delteDialog(
                context,
                () {
                  BlocProvider.of<MyAdsCubit>(context).deleteAdd(context,bookModel.id.toString());
                  BlocProvider.of<MyAdsCubit>(context).fetchMyBooks(BlocProvider.of<LoginCubit>(context).userModel.accessToken);

                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Delete",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _delteDialog(BuildContext context, void Function() onTap) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Add'),
          content: const Text('Are you sure you want to delete your add\n'
              'press yes to delete it\n'
              'press no to Cancel it\n'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                onTap();
              },
            ),
          ],
        );
      },
    );
  }
}
