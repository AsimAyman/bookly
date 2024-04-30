import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/utils/theme.dart';
import 'package:book_extchange/core/widgets/custom_center_loading_widget.dart';
import 'package:book_extchange/core/widgets/custom_text_form_field.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/chat/view/view_models/chat_cubit.dart';
import 'package:book_extchange/features/chat/view/views/widgets/custom_container_point_to_book.dart';
import 'package:book_extchange/features/chat/view/views/widgets/custom_text_form_field_send_message.dart';
import 'package:book_extchange/features/chat/view/views/widgets/my_message_container.dart';
import 'package:book_extchange/features/chat/view/views/widgets/sender_message_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailsBody extends StatelessWidget {
  const ChatDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var chatCubit = BlocProvider.of<ChatCubit>(context);
    int userId = BlocProvider.of<LoginCubit>(context).userModel.id;

    return chatCubit.chatRoomDetailsModel == null
        ? const SizedBox()
        : SizedBox(
            width: deviceWidth,
            height: deviceHeight,
            child: Stack(
              children: [
                Container(
                  height: 80,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomContainerPointToBook(
                        bookModel: chatCubit.chatRoomDetailsModel!.bookModel,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  height: deviceHeight - 80,
                  width: deviceWidth,
                  top: 80,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount:
                          chatCubit.chatRoomDetailsModel!.messageModels.length,
                      itemBuilder: (context, index) {
                        return chatCubit.chatRoomDetailsModel!
                                    .messageModels[index].buyer_id ==
                                userId
                            ? MyMessageContainer(
                                txt: chatCubit.chatRoomDetailsModel!
                                    .messageModels[index].content)
                            : chatCubit.chatRoomDetailsModel!
                                        .messageModels[index].seller_id ==
                                    userId
                                ? SenderMessageContainer(
                                    txt: chatCubit.chatRoomDetailsModel!
                                        .messageModels[index].content)
                                : SizedBox();
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 70,
                    width: deviceWidth,
                    color: Colors.grey.shade200,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: deviceWidth - 20,
                            child: TextFormFieldSendMessage(
                              textEditingController: TextEditingController(),
                              onSumbit: (p0) {
                                chatCubit.sendMessage(BlocProvider.of<LoginCubit>(context).userModel.accessToken, chatCubit.chatRoomDetailsModel!.roomId.toString(), p0);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
