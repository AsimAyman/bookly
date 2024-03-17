class GovernModel {
  final String name;
  final String id;

  GovernModel({required this.name, required this.id});

  factory GovernModel.fromJson(json) {
    return GovernModel(
      name: json['governorate_name_ar'],
      id: json['id'],
    );
  }
}
