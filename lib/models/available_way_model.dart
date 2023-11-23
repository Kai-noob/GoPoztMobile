import 'city_model.dart';
import 'township_model.dart';

// class Township {
//   int id;
//   String name;
//   String abbr;
//   int cityId;
//   int isAvailable;
//   String createdAt;
//   String updatedAt;

//   Township({
//     required this.id,
//     required this.name,
//     required this.abbr,
//     required this.cityId,
//     required this.isAvailable,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Township.fromJson(Map<String, dynamic> json) {
//     return Township(
//       id: json['id'],
//       name: json['name'],
//       abbr: json['abbr'],
//       cityId: json['city_id'],
//       isAvailable: json['isAvailable'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }

class AvaliableWay {
  City fromCity;
  City toCity;
  Township township;
  String fee;

  AvaliableWay({
    required this.fromCity,
    required this.toCity,
    required this.township,
    required this.fee,
  });

  factory AvaliableWay.fromJson(Map<String, dynamic> json) {
    return AvaliableWay(
      fromCity: City.fromJson(json['from_city']),
      toCity: City.fromJson(json['to_city']),
      township: Township.fromJson(json['township']),
      fee: json['fee'],
    );
  }
}
