import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

class ReceiverWayCountWidget extends StatelessWidget {
  final DeliveryController controller;
  const ReceiverWayCountWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        width: 100,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "WAY ${controller.parcels.length + 1}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
