import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../models/order_model.dart';

class OrderDetailsStatusWidget extends StatelessWidget {
  final Order order;
  const OrderDetailsStatusWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Order Status:${order.status.capitalize}",
      style: TextStyle(
          color: order.status == 'pending' ? Colors.black : Colors.greenAccent,
          fontSize: 14.sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
    );
  }
}
