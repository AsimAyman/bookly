class CategoryModel {
  final String name;
  final int id;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
