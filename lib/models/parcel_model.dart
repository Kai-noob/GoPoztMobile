import 'package:logger/logger.dart';
import 'package:mengo_delivery/models/receiver_model.dart';

class ParcelModel {
  String pickupTime;
  String deliveryTime;
  String itemType;
  int prepaid;
  String parcelSize;
  double parcelWeight;
  List<String> parcelPhotos;
  double collectCashAmount;
  ReceiverModel receiver;

  ParcelModel({
    required this.pickupTime,
    required this.deliveryTime,
    required this.itemType,
    required this.prepaid,
    required this.parcelSize,
    required this.parcelWeight,
    required this.parcelPhotos,
    required this.collectCashAmount,
    required this.receiver,
  });

  factory ParcelModel.fromJson(Map<String, dynamic> json) {
    return ParcelModel(
      pickupTime: json['pickup_time'],
      deliveryTime: json['delivery_time'],
      itemType: json['item_type'],
      prepaid: json['prepaid'],
      parcelSize: json['parcel_size'],
      parcelWeight: json['parcel_weight'],
      parcelPhotos: List<String>.from(json['parcel_photos']),
      collectCashAmount: json['collect_cash_amount'],
      receiver: json['receiver'],
    );
  }

  Map<String, dynamic> toJson() {
    Logger().e(parcelPhotos.toList());
    final Map<String, dynamic> data = {
      'pickup_time': pickupTime,
      'delivery_time': deliveryTime,
      'item_type': itemType,
      'prepaid': prepaid,
      'parcel_size': 'md',
      'parcel_weight': parcelWeight,
      'parcel_photos': null,
      'collect_cash_amount': collectCashAmount,
      'receiver': receiver.toJson()
    };

    return data;
  }
}
