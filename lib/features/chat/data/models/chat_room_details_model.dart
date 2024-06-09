// ignore_for_file: empty_catches

import 'package:bookly/features/chat/data/models/message_model.dart';
import 'package:bookly/features/home/data/models/book_model.dart';

class ChatRoomDetailsModel {
  final String sellerName;
  final int roomId;
  final BookModel bookModel;
  final List<MessageModel> messageModels;

  ChatRoomDetailsModel(
      {required this.sellerName,
      required this.roomId,
      required this.bookModel,
      required this.messageModels});

  factory ChatRoomDetailsModel.fromJson(jsonData) {
    List<MessageModel> mModels = [];
    jsonData['messages'].forEach((e) {
      try{
        mModels.add(MessageModel.fromJson(e));
      }catch(e){
         
      }
    });
    return ChatRoomDetailsModel(
      sellerName: jsonData['name'],
      roomId: jsonData['id'],
      bookModel: BookModel.fromJson(jsonData['book']),
      messageModels: mModels,
    );
  }
}
