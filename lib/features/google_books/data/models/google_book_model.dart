class GoogleBookModel {
  String id;
  String title;
  String author;
  String? imageUrl;
  double averageRating;
  int ratingsCount;
  double price;
  String category;
  String previewLink;

  GoogleBookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.averageRating,
    required this.ratingsCount,
    required this.price,
    this.imageUrl,
    required this.category,
    required this.previewLink,
  });

  factory GoogleBookModel.fromJson(jsonData) {
    return GoogleBookModel(
      id: jsonData['id'],
      title: jsonData['volumeInfo']['title'],
      author: jsonData['volumeInfo']['authors'][0],
      imageUrl: jsonData['volumeInfo']['imageLinks']?['thumbnail'],
      averageRating:
      (jsonData['volumeInfo']['averageRating'])?.toDouble() ?? 0,
      ratingsCount: (jsonData['volumeInfo']['ratingsCount'])?.toInt() ?? 0,
      price: 25.2,
      category: jsonData['volumeInfo']['categories'][0],
      previewLink: jsonData['volumeInfo']['previewLink'],);
  }
}
