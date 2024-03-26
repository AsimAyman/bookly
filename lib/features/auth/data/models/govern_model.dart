class GovernModel {
  final String name;
  final String id;


  const GovernModel({required this.name, required this.id,});

  factory GovernModel.fromJson(json) {
    return GovernModel(
        name: json['city_name_ar'],
        id: json['id'],
    );
  }

}
