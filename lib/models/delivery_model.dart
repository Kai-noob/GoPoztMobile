import 'package:mengo_delivery/models/parcel_model.dart';
import 'package:mengo_delivery/models/receiver_model.dart';
import 'package:mengo_delivery/models/sender_model.dart';

class DeliveryModel {
  SenderModel sender;
  List<ParcelModel> parcels;


  DeliveryModel({required this.sender,required this.parcels});

  Map<String,dynamic> toJson(){
    return {
      'sender':sender.toJson(),
      
      // 'parcels': parcels.map((parcel) => parcel.toJson()).toList(),
    };
  }
}