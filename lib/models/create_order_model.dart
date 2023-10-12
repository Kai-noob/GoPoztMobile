import 'package:mengo_delivery/models/receiver_model.dart';
import 'package:mengo_delivery/models/sender_model.dart';

class CreateOrderModel {
  String pickupTime;
  String deliveryTime;
  String itemType;
  bool prepaid;
  String parcelSize;
  double parcelWeight;
  String collectCashAmount;
  String? parcelDescription;
  List<SenderModel> senders;
  List<ReceiverModel> receivers;
  List<String> parcelPhotos;

  CreateOrderModel({
    required this.pickupTime,
    required this.deliveryTime,
    required this.itemType,
    required this.prepaid,
    required this.parcelSize,
    required this.parcelWeight,
    required this.collectCashAmount,
    this.parcelDescription,
    required this.senders,
    required this.receivers,
    required this.parcelPhotos,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pickup_time'] = pickupTime;
    data['delivery_time'] = deliveryTime;
    data['item_type'] = itemType;
    data['prepaid'] = prepaid;
    data['parcel_size'] = parcelSize;
    data['parcel_weight'] = parcelWeight;
    data['collect_cash_amount'] = collectCashAmount;
    data['parcel_description'] = parcelDescription;
    data['senders'] = senders.map((sender) => sender.toJson()).toList();
    data['receivers'] = receivers.map((receiver) => receiver.toJson()).toList();
    data['parcel_photos'] = parcelPhotos;
    return data;
  }
}
