import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';

import 'package:mengo_delivery/models/sender_model.dart';

import '../../../models/receiver_model.dart';
import '../../../utils/app_colors.dart';

class DeliveryNavBarOrderWidget extends StatelessWidget {
  final DeliveryController controller;
  final List<SenderModel> senders;
  final List<ReceiverModel> receivers;
  const DeliveryNavBarOrderWidget({
    super.key,
    required this.controller,
    required this.senders,
    required this.receivers,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            controller.createOrder(context, senders, receivers);
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: primaryColor),
            child: Text(
              "Order now",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
