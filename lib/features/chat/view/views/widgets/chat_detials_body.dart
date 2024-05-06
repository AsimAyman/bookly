import 'package:Bookly/core/utils/measures.dart';
import 'package:Bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:Bookly/features/chat/view/view_models/chat_cubit.dart';
import 'package:Bookly/features/chat/view/views/widgets/custom_container_point_to_book.dart';
import 'package:Bookly/features/chat/view/views/widgets/custom_text_form_field_send_message.dart';
import 'package:Bookly/features/chat/view/views/widgets/my_message_container.dart';
import 'package:Bookly/features/chat/view/views/widgets/sender_message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailsBody extends StatefulWidget {
  const ChatDetailsBody({super.key, required this.chatRoomId});

  final String chatRoomId;

  @override
  State<ChatDetailsBody> createState() => _ChatDetailsBodyState();
}

class _ChatDetailsBodyState extends State<ChatDetailsBody> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ChatCubit>(context).listenToMessagesStream(
        BlocProvider.of<LoginCubit>(context).userModel.accessToken,
        widget.chatRoomId);
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  ChatCubit? _chatCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _chatCubit =  BlocProvider.of<ChatCubit>(context);
  }

  @override
  void dispose() {
    _chatCubit?.channel.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var chatCubit = BlocProvider.of<ChatCubit>(context);
    int userId = BlocProvider.of<LoginCubit>(context).userModel.id;

    return chatCubit.chatRoomDetailsModel == null
        ? const SizedBox()
        : Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                // height: deviceHeight - 80,
                width: deviceWidth,
                bottom: 0,
                top: 0,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: chatCubit
                              .chatRoomDetailsModel!.messageModels.length,
                          itemBuilder: (context, index) {
                            return chatCubit.chatRoomDetailsModel!
                                        .messageModels[index].senderId ==
                                    userId.toString()
                                ? MyMessageContainer(
                                    txt: chatCubit.chatRoomDetailsModel!
                                        .messageModels[index].content)
                                : SenderMessageContainer(
                                    txt: chatCubit.chatRoomDetailsModel!
                                        .messageModels[index].content);
                          },
                        ),
                        BlocBuilder<ChatCubit, ChatState>(
                          builder: (context, state) {
                             
                             
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: chatCubit.newMessages.length,
                              itemBuilder: (context, index) {
                                return chatCubit.newMessages[index].senderId ==
                                        userId.toString()
                                    ? MyMessageContainer(
                                        txt: chatCubit
                                            .newMessages[index].content)
                                    : SenderMessageContainer(
                                        txt: chatCubit
                                            .newMessages[index].content);
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 75,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 80,
                  width: deviceWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomContainerPointToBook(
                        bookModel: chatCubit.chatRoomDetailsModel!.bookModel,
                      ),
                    ],
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
                            textEditingController: messageController,
                            onSumbit: (p0) async {
                              messageController.clear();
                              await chatCubit.sendMessage(
                                BlocProvider.of<LoginCubit>(context)
                                    .userModel
                                    .accessToken,
                                chatCubit.chatRoomDetailsModel!.roomId
                                    .toString(),
                                p0,
                              );
                              // messageController.dispose();
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
