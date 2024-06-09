import 'package:bookly/features/chat/data/models/message_model.dart';

class ChatRoomModel {
  final String imgUrl;
  final String sellerName;
  final int roomId;
  final String lastMessage;
  final String dateOfLastMessage;

  ChatRoomModel(
      {required this.imgUrl,
      required this.sellerName,
      required this.roomId,
      required this.lastMessage,
      required this.dateOfLastMessage});

  factory ChatRoomModel.fromJson(jsonData) {
    List<MessageModel> messageModels = [];
    List mesages = jsonData['messages'];
    for(var m in mesages){
      messageModels.add(MessageModel.fromJson(m));
    }
    return ChatRoomModel(
      imgUrl: jsonData['book']['image'][0],
      sellerName: jsonData['name'],
      roomId: jsonData['id'],
      lastMessage: messageModels.isEmpty ? "" : messageModels.last.content,
      dateOfLastMessage: messageModels.isEmpty ? "" :  messageModels.last.time,
    );
  }
}
