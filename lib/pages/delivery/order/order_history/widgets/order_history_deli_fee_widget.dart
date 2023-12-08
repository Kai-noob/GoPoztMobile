import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/orders_controller.dart';

class OrderHistoryDeliFeeWidget extends StatelessWidget {
  final int wayIndex;
  final int orderIndex;
  final OrdersController controller;
  const OrderHistoryDeliFeeWidget({
    super.key,
    required this.wayIndex,
    required this.orderIndex,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        30.horizontalSpace,
        Text(
          "Deli fees-${controller.orders[orderIndex].parcels[wayIndex].parcelTotalAmount} MMK",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        15.horizontalSpace,
        Text(
          "${controller.orders[orderIndex].parcels[wayIndex].deliveryTime.capitalize}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
