import 'package:mengo_delivery/models/city_model.dart';
import 'package:mengo_delivery/models/township_model.dart';

class DelivererModel {
  final int id;
  final String name;
  final String profile;
  final String phone;

  final String did;
  final City city;
  final Township townships;
  final List<Township> availableTownships;
  final int active;
  final int available;
  final int balance;

  final dynamic document;
  final List<String> roles;
  final String createdAt;
  final String updatedAt;

  DelivererModel({
    required this.id,
    required this.profile,
    required this.name,
    required this.phone,
    required this.did,
    required this.city,
    required this.townships,
    required this.availableTownships,
    required this.active,
    required this.available,
    required this.balance,
    required this.document,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DelivererModel.fromJson(Map<String, dynamic> json) {
    return DelivererModel(
      id: json['id'],
      profile: json['profile'],
      name: json['name'],
      phone: json['phone'],
      did: json['DID'],
      city: City.fromJson(json['city']),
      townships: Township.fromJson(json['townships']),
      availableTownships: (json['available_townships'] as List<dynamic>)
          .map((townshipJson) => Township.fromJson(townshipJson))
          .toList(),
      active: json['active'],
      available: json['available'],
      balance: json['balance'],
      document: json['document'],
      roles: List<String>.from(json['roles']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
