class CityModel {
  final String name;
  final String id;
  final String govId;

  CityModel({required this.name, required this.id, required this.govId});

  factory CityModel.fromJson(json) {
    return CityModel(
      name: json['city_name_ar'],
      id: json['id'],
      govId: json['governorate_id']
    );
  }
}
