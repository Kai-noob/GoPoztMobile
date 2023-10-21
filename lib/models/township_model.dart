class TownshipModel {
  List<Township> townships;
  String message;

  TownshipModel({
    required this.townships,
    required this.message,
  });

  factory TownshipModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> townshipList = json['townships'];
    List<Township> townships = townshipList
        .map((townshipJson) => Township.fromJson(townshipJson))
        .toList();

    return TownshipModel(
      townships: townships,
      message: json['message'],
    );
  }
}

class Township {
  int id;
  String abbr;
  int isAvailable;
  String name;

  Township({
    required this.id,
    required this.abbr,
    required this.isAvailable,
    required this.name,
  });

  factory Township.fromJson(Map<String, dynamic> json) {
    return Township(
      id: json['id'],
      abbr: json['abbr'],
      isAvailable: json['isAvailable'],
      name: json['name'],
    );
  }
}
