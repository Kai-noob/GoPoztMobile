import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';

class OrderHistoryCommonWidget extends StatelessWidget {
  final String label;
  final OrdersController controller;
  const OrderHistoryCommonWidget(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
