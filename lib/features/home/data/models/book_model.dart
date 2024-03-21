class BookModel {
  final String id;
  final String sellerId;
  final String sellerPhone;
  final String title;
  final String description;
  final String govern;
  final double price;
  final bool isNegotiable;
  final bool isExchangeable;
  final String addedDateTime;
  final List<String> imgsPath;

  BookModel({
    required this.id,
    required this.sellerId,
    required this.sellerPhone,
    required this.title,
    required this.description,
    required this.govern,
    required this.price,
    required this.isNegotiable,
    required this.isExchangeable,
    required this.addedDateTime,
    required this.imgsPath,
  });

  factory BookModel.fromJson(json) {
    return BookModel(
      id: json['id'],
      sellerId: json['sellerId'],
      sellerPhone: json['sellerPhone'],
      title: json['title'],
      description: json['description'],
      govern: json['govern'],
      price: json['price'],
      isNegotiable: json['isNegotiable'],
      isExchangeable: json['isExchangeable'],
      addedDateTime: json['addedDateTime'],
      imgsPath: json['imgsPath'],
    );
  }

  toJson() {
    return {
      "id": id,
      "sellerId": sellerId,
      "sellerPhone": sellerPhone,
      "title": title,
      "description": description,
      "govern": govern,
      "price": price,
      "isNegotiable": isNegotiable,
      "isExchangeable": isExchangeable,
      "addedDateTime": addedDateTime,
      "imgsPath": imgsPath,
    };
  }
}
