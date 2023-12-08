import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';
import 'package:mengo_delivery/models/order_model.dart';

import '../../../../../controllers/delivery_controller.dart';

class OrderDetailsDateWidget extends StatelessWidget {
  final Order order;
  const OrderDetailsDateWidget({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Date: ${DateFormat('E-d-M-yyyy').format(DateTime.parse(order.createdAt))}",
      style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          overflow: TextOverflow.ellipsis),
    );
  }
}
