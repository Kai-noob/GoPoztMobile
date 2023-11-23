class UserModel {
  int? id;
  String? name;
  String? phone;
  String? level;
  String? profile;

  UserModel({this.id, this.name, this.phone, this.level, this.profile});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] as int,
        name: json['name'] as String,
        phone: json['phone'] as String,
        level: json['level'] as String,
        profile: json['profile']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'level': level,
      'profile': profile
    };
  }
}
