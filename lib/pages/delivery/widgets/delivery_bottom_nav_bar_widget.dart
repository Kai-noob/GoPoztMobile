import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/models/parcel_model.dart';

import '../../../models/receiver_model.dart';
import '../../../models/sender_model.dart';

import 'delivery_navbar_estimation_widget.dart';
import 'delivery_navbar_order_widget.dart';

class DeliveryBottomNavBarWidget extends StatelessWidget {
  final DeliveryController controller;
  final ReceiverController receiverController;
  final SenderModel sender;
  final List<ParcelModel> parcels;
  final int? partnerId;
  final bool? isPartner;
  const DeliveryBottomNavBarWidget(
      {super.key,
      required this.controller,
      required this.sender,
      required this.parcels,
      required this.receiverController,
      required this.partnerId,
      required this.isPartner});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      height: 55.h,
      child: Row(children: [
        DeliveryNavBarEstimationWidget(
          receiverController: receiverController,
        ),
        DeliveryNavBarOrderWidget(
          controller: controller,
          sender: sender,
          parcels: parcels,
          isPartner: isPartner,
          partnerId: partnerId,
        )
      ]),
    );
  }
}
