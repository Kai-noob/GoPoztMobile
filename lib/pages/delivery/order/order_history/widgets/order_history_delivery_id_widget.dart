// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../controllers/delivery_controller.dart';
import '../../../../../controllers/orders_controller.dart';

class OrderHistoryDeliveryIdWidget extends StatelessWidget {
  final int index;
  final OrdersController controller;
  const OrderHistoryDeliveryIdWidget({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery id:${controller.orders[index].deliverer == null ? "" : controller.orders[index].deliverer!.id}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            controller.orders[index].deliverer == null
                ? ""
                : controller.orders[index].deliverer!.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
