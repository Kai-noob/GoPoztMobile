class TownshipModel {
  List<Township> townships;
  String message;

  TownshipModel({
    required this.townships,
    required this.message,
  });

  factory TownshipModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> townshipList = json['townships'];
    List<Township> townships =
        townshipList.map((townshipJson) => Township.fromJson(townshipJson)).toList();

    return TownshipModel(
      townships: townships,
      message: json['message'],
    );
  }
}

class Township {
  int id;
  String name;

  Township({
    required this.id,
    required this.name,
  });

  factory Township.fromJson(Map<String, dynamic> json) {
    return Township(
      id: json['id'],
      name: json['name'],
    );
  }
}
