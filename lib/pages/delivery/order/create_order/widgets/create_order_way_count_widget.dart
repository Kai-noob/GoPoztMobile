import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateOrderWayCountWidget extends StatelessWidget {
  final DeliveryController controller;
  const CreateOrderWayCountWidget({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {  
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: blackColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        "WAY ${controller.parcels.length+1}",
        style: TextStyle(color: white, fontSize: 12.sp),
      ),
    );
  }
}