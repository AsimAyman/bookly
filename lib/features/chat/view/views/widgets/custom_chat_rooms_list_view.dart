import 'package:Bookly/features/chat/data/models/chat_room_model.dart';
import 'package:Bookly/features/chat/view/views/widgets/custom_chat_card.dart';
import 'package:flutter/material.dart';

class CustomChatRoomsListView extends StatelessWidget {
  const CustomChatRoomsListView({super.key, required this.chatRoomModels});

  final List<ChatRoomModel> chatRoomModels;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return   Column(
          children: [
            CustomChatCard(chatRoomModel: chatRoomModels[index],),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      }, itemCount: chatRoomModels.length,),
    );
  }
}