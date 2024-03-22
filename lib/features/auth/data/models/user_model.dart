class UserModel {
  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String govern;
  final String city;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.govern,
    required this.city,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobileNumber: json['mobile_number'],
      govern: json['city'],
      city: json['town'],
    );
  }

  toJson(){
    return {
      "id":id,
      "name":name,
      "email":email,
      "mobile_number":mobileNumber,
      "city":govern,
      "town":city,
    };
  }

}
