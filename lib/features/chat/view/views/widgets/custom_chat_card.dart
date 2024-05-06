// ignore_for_file: empty_catches

import 'package:Bookly/core/routing/routes.dart';
import 'package:Bookly/core/utils/measures.dart';
import 'package:Bookly/features/chat/data/models/chat_room_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';


class CustomChatCard extends StatelessWidget {
   CustomChatCard({
    super.key, required this.chatRoomModel,
  });

  final ChatRoomModel chatRoomModel;
  DateTime? parseDate;
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    try{
      parseDate = DateFormat("dd MMM yyyy HH:mm").parse("${chatRoomModel.dateOfLastMessage}");
      dateTime = DateTime.parse(parseDate.toString());
    }catch(e){

    }
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.kChatDetailsView,extra: chatRoomModel.roomId);
      },
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: AspectRatio(
                aspectRatio: 60 / 72,
                child: Image.network(chatRoomModel.imgUrl,fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatRoomModel.sellerName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: deviceWidth - 230,
                  child: Text(
                    chatRoomModel.lastMessage,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  ),
                )
              ],
            ),
            const SizedBox(width: 16,),
            dateTime == null ? const SizedBox() :  Text("${dateTime!.day} / ${dateTime!.month}  ${dateTime!.hour}:${dateTime!.minute}"),
          ],
        ),
      ),
    );
  }
}