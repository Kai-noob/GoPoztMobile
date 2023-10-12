class SenderModel {
  String name;
  String phone;
  int cityId;
  int townshipId;
  String street;
  String description;

  SenderModel({
    required this.name,
    required this.phone,
    required this.cityId,
    required this.townshipId,
    required this.street,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'city_id': cityId,
      'township_id': townshipId,
      'street': street,
      'description': description,
    };
  } 
  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      name: json['name'],
      phone: json['phone'],
      cityId: json['city_id'],
      townshipId: json['township_id'],
      street: json['street'],
      description: json['description'],
    );
  }
}