class ReceiverModel {
  String name;
  String phone;
  int cityId;
  int townshipId;
  String street;
  String description;

  ReceiverModel({
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
  factory ReceiverModel.fromJson(Map<String, dynamic> json) {
    return ReceiverModel(
      name: json['name'],
      phone: json['phone'],
      cityId: json['city_id'],
      townshipId: json['township_id'],
      street: json['street'],
      description: json['description'],
    );
  }
}