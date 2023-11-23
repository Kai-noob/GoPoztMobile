import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';

import '../../../../../controllers/delivery_controller.dart';

class OrderHistoryDateWidget extends StatelessWidget {
  final int index;
  final OrdersController controller;
  const OrderHistoryDateWidget({
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Text(
        DateFormat('E/d-M-yyyy')
            .format(DateTime.parse(controller.orders[index].createdAt)),
        style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
