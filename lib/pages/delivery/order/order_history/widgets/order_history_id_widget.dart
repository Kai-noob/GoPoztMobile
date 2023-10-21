import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';


class OrderHistoryIdWidget extends StatelessWidget {
  final int index;
  final DeliveryController controller;
  const OrderHistoryIdWidget({
    super.key,
    required this.index,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Text(
        "Order id:${controller.orders[index].id}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}