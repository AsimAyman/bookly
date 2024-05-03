class MessageModel {
  final String content;
  final String senderId;
  final String time;



  MessageModel(
      {required this.content,
        required this.senderId,
        required this.time});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      content: jsonData['content'],
      senderId: jsonData['sender_id'].toString(),
      time: jsonData['time'],
    );
  }
}
