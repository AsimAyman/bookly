class MessageModel {
  final String content;
  final int buyer_id;
  final int seller_id;
  final String time;



  MessageModel(
      {required this.content,
        required this.buyer_id,
        required this.seller_id,
        required this.time});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      content: jsonData['content'],
      buyer_id: jsonData['buyer_id'],
      seller_id: jsonData['seller_id'],
      time: jsonData['time'],
    );
  }
}
