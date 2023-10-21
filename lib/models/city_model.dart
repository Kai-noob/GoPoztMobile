class CityModel {
  List<City> cities;
  String message;

  CityModel({
    required this.cities,
    required this.message,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> cityList = json['cities'];
    List<City> cities =
        cityList.map((cityJson) => City.fromJson(cityJson)).toList();

    return CityModel(
      cities: cities,
      message: json['message'],
    );
  }
}

class City {
  int id;

  int isAvailable;
  String name;

  City({
    required this.id,

    required this.isAvailable,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],

      isAvailable: json['isAvailable']
    );
  }
}
