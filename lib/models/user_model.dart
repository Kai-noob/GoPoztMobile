class UserModel {
  final int id;
  final String name;
  final String phone;
  final String level;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.level,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      level: json['level'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'level': level,
    };
  }
}