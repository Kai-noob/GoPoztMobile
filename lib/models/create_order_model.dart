// import 'dart:convert';

// import 'package:mengo_delivery/models/parcel_model.dart';
// import 'package:mengo_delivery/models/sender_model.dart';

// class CreateOrderModel {
//   List<SenderModel> senders;
//   List<ParcelModel> parcels;

//   CreateOrderModel({
//     required this.senders,
//     required this.parcels,
//   });

//   factory CreateOrderModel.fromJson(Map<String, dynamic> json) {
//     List<SenderModel> senderList = List<SenderModel>.from(
//         json['senders'].map((sender) => SenderModel.fromJson(sender)));
//     List<ParcelModel> parcelList = List<ParcelModel>.from(
//         json['parcels'].map((parcel) => ParcelModel.fromJson(parcel)));
//     return CreateOrderModel(senders: senderList, parcels: parcelList);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {
//       'senders': json.encode(
      
//       ),
//       'parcels': json.encode(

//       )
//     };
//     return data;
//   }
// }
