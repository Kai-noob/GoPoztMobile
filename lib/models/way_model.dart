class WayModel {
  final FromRegion fromRegion;
  final ToRegion toRegion;
  final String township;
  final double fee;

  WayModel({
    required this.fromRegion,
    required this.toRegion,
    required this.township,
    required this.fee,
  });

  factory WayModel.fromJson(Map<String, dynamic> json) {
    return WayModel(
      fromRegion: FromRegion.fromJson(json['from_region']),
      toRegion: ToRegion.fromJson(json['to_region']),
      township: json['township'],
      fee: double.parse(json['fee']),
    );
  }
}

class FromRegion {
  final int id;
  final String name;

  FromRegion({
    required this.id,
    required this.name,
  });

  factory FromRegion.fromJson(Map<String, dynamic> json) {
    return FromRegion(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ToRegion {
  final int id;
  final String name;

  ToRegion({
    required this.id,
    required this.name,
  });

  factory ToRegion.fromJson(Map<String, dynamic> json) {
    return ToRegion(
      id: json['id'],
      name: json['name'],
    );
  }
}