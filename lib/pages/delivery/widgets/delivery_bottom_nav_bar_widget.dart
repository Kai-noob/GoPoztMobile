import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mengo_delivery/controllers/delivery_controller.dart';


import '../../../models/receiver_model.dart';
import '../../../models/sender_model.dart';

import 'delivery_navbar_estimation_widget.dart';
import 'delivery_navbar_order_widget.dart';

class DeliveryBottomNavBarWidget extends StatelessWidget {
  final DeliveryController controller;
  final List<SenderModel> senders;
  final List<ReceiverModel> receivers;
  const DeliveryBottomNavBarWidget(
      {super.key,
      required this.controller,
      required this.senders,
      required this.receivers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: Row(children: [
        const DeliveryNavBarEstimationWidget(),
        DeliveryNavBarOrderWidget(
          controller: controller,
          senders: senders,
          receivers: receivers,
        )
      ]),
    );
  }
}
