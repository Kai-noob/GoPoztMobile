import 'package:mengo_delivery/models/receiver_model.dart';
import 'package:mengo_delivery/models/sender_model.dart';

class DeliveryModel {
  List<Order> orders;

  DeliveryModel({required this.orders});

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> orderList = json['orders'];
    List<Order> orders = orderList.map((e) => Order.fromJson(e)).toList();
    return DeliveryModel(orders: orders);
  }
}

class Order {
  int id;
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
  String createdAt;
  String updatedAt;

  Order({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    List<dynamic> senderList = json['senders'];
    List<dynamic> receiverList = json['receivers'];
    List<String> parcelPhotos = json['parcel_photos'].cast<String>();

    List<SenderModel> senders =
        senderList.map((e) => SenderModel.fromJson(e)).toList();
    List<ReceiverModel> receivers =
        receiverList.map((e) => ReceiverModel.fromJson(e)).toList();

    return Order(
      id: json['id'],
      pickupTime: json['pickup_time'],
      deliveryTime: json['delivery_time'],
      itemType: json['item_type'],
      prepaid: json['prepaid'],
      parcelSize: json['parcel_size'],
      parcelWeight: json['parcel_weight'].toDouble(),
      collectCashAmount: json['collect_cash_amount'],
      parcelDescription: json['parcel_description'],
      senders: senders,
      receivers: receivers,
      parcelPhotos: parcelPhotos,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

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
