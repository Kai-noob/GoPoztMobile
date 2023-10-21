
import 'city_model.dart';
import 'township_model.dart';

class OrderResponse {
  final List<Order> orders;

  OrderResponse({required this.orders});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> ordersJson = json['orders'];
    final List<Order> orders =
        ordersJson.map((task) => Order.fromJson(task)).toList();
    return OrderResponse(orders: orders);
  }
}

class Order {
  final int id;
  final Sender sender;
  final List<Parcel> parcels;
  final dynamic deliverer;
  final String status;
  final String createdAt;
  final String updatedAt;

  Order({
    required this.id,
    required this.sender,
    required this.parcels,
    required this.deliverer,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final List<dynamic> parcelsJson = json['parcels'];
    final List<Parcel> parcels =
        parcelsJson.map((parcel) => Parcel.fromJson(parcel)).toList();
    return Order(
      id: json['id'],
      sender: Sender.fromJson(json['sender']),
      parcels: parcels,
      deliverer: json['deliverer'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Sender {
  final int id;
  final String name;
  final String phone;
  final City cityId;
  final Township townshipId;
  final String street;
  final dynamic description;

  Sender({
    required this.id,
    required this.name,
    required this.phone,
    required this.cityId,
    required this.townshipId,
    required this.street,
    required this.description,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      cityId: City.fromJson(
        json['city_id'],
      ),
      townshipId: Township.fromJson(json['township_id']),
      street: json['street'],
      description: json['description'],
    );
  }
}

class Parcel {
  final String pickupTime;
  final String deliveryTime;
  final String itemType;
  final bool prepaid;
  final String parcelSize;
  final int parcelWeight;
  final String? parcelDescription;
  final Receiver receiver;
  final List<dynamic> parcelPhotos;
  final int? collectCashAmount;
  final int? parcelTotalAmount;

  Parcel({
    required this.pickupTime,
    required this.deliveryTime,
    required this.itemType,
    required this.prepaid,
    required this.parcelSize,
    required this.parcelWeight,
     this.parcelDescription,
    required this.receiver,
    required this.parcelPhotos,
     this.collectCashAmount,
     this.parcelTotalAmount
  });

  factory Parcel.fromJson(Map<String, dynamic> json) {
    return Parcel(
      pickupTime: json['pickup_time'],
      deliveryTime: json['delivery_time'],
      itemType: json['item_type'],
      prepaid: json['prepaid'],
      parcelSize: json['parcel_size'],
      parcelWeight: json['parcel_weight'],
      parcelDescription: json['parcel_description'],
      receiver: Receiver.fromJson(json['receiver']),
      parcelPhotos: json['parcel_photos'],
      collectCashAmount: json['collect_cash_amount'],
      parcelTotalAmount:json['parcel_total_amount']
    );
  }
}

class Receiver {
  final int id;
  final String name;
  final String phone;
  final City cityId;
  final Township townshipId;
  final String street;
  final String description;

  Receiver({
    required this.id,
    required this.name,
    required this.phone,
    required this.cityId,
    required this.townshipId,
    required this.street,
    required this.description,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      cityId: City.fromJson(json['city_id'],),
      townshipId: Township.fromJson(json['township_id'],),
      street: json['street'],
      description: json['description'],
    );
  }
}
