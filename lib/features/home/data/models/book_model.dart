class BookModel {
  final int id;
  final String title;
  final String description;
  final String govern;
  final String city;
  final String price;
  final int isNegotiable;
  final int isExchangeable;
  final int status;
  final String ownerName;
  final String ownerPhone;
  final String category;
  final String? subCategory;
  final String? subject;
  final List imgsPath;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.govern,
    required this.city,
    required this.price,
    required this.isNegotiable,
    required this.isExchangeable,
    required this.status,
    required this.ownerName,
    required this.ownerPhone,
    required this.category,
    required this.subCategory,
    required this.subject,
    required this.imgsPath,
  });

  factory BookModel.fromJson(json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      govern: json['city'],
      city: json['town'],
      price: json['price'],
      isNegotiable: json['negationable'],
      isExchangeable: json['exchangable'],
      status: json['state'],
      ownerName: json['owner']['name'],
      ownerPhone: json['owner']['phone'],
      category:json['category'] ,
      subCategory: json['sub_category'],
      subject: json['subject'],
      imgsPath: json['image'],
    );
  }

  // toJson() {
  //   return {
  //     "id": id,
  //     "sellerId": sellerId,
  //     "sellerPhone": sellerPhone,
  //     "title": title,
  //     "description": description,
  //     "govern": govern,
  //     "price": price,
  //     "isNegotiable": isNegotiable,
  //     "isExchangeable": isExchangeable,
  //     "addedDateTime": addedDateTime,
  //     "imgsPath": imgsPath,
  //   };
  // }
}
