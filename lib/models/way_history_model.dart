// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mengo_delivery/models/parcel_model.dart';
import 'package:mengo_delivery/models/way_fee_model.dart';

class WayHistoryModel {
  WayFeeModel wayFeeModel;
  ParcelModel parcelModel;
  WayHistoryModel({
    required this.wayFeeModel,
    required this.parcelModel,
  });
}
