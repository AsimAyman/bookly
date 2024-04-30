import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_error_dialog.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';

import 'package:book_extchange/features/book_details/view/views/widgets/back_button.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_button_icon_text.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_carousel_images.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_description_text.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_fav_button.dart';
import 'package:book_extchange/features/book_details/view/views/widgets/custom_price_and_city.dart';
import 'package:book_extchange/features/chat/view/view_models/chat_cubit.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is CreateChatFailure) {
          customErrorDialog(context,
              title: "Error", content: state.errorMessage);
        }
        if (state is CreateChatSuccess) {
          GoRouter.of(context).pushNamed(Routes.kChatDetailsView,extra: state.roomId);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is CreateChatLoading,
          child: SizedBox(
            width: deviceWidth,
            height: deviceHeight,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CustomCarouselImages(
                            imgs: bookModel.imgsPath,
                          ),
                          const CustomBackButton(),
                          FavButton(
                            bookId: bookModel.id.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookModel.title,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const Divider(
                              height: 32,
                            ),
                            CustomPriceAndCity(
                              bookModel: bookModel,
                            ),
                            const Divider(
                              height: 32,
                            ),
                            CustomDescriptionText(
                              txt: bookModel.description,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: CustomButtonIconText(
                          txt: "Phone",
                          iconData: Icons.phone,
                          onTap: () async {
                            final Uri uri = Uri(
                                scheme: "tel", path: "${bookModel.ownerPhone}");
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              Clipboard.setData(
                                  ClipboardData(text: bookModel.ownerPhone));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Copied Phone Number Successfully")));
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: CustomButtonIconText(
                          txt: "Chat",
                          iconData: Icons.sms,
                          isBackPrimary: false,
                          onTap: () {
                            BlocProvider.of<ChatCubit>(context).createChatRoom(
                                BlocProvider.of<LoginCubit>(context)
                                    .userModel
                                    .accessToken,
                                bookModel.id.toString());
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
