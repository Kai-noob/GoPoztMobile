import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/delivery_controller.dart';
import '../../../../../controllers/orders_controller.dart';
import '../../../../../utils/app_colors.dart';

class OrderHistoryWayWidget extends StatelessWidget {
  final int wayIndex;
  final int orderIndex;
  final OrdersController controller;
  const OrderHistoryWayWidget({
    super.key,
    required this.orderIndex,
    required this.wayIndex,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Way ${wayIndex + 1} ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 6,
          child: Text(
            controller.orders[orderIndex].parcels[wayIndex].receiver.city.name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        const Spacer(),
        // Expanded(
        //   flex: 4,
        //   child: Text(
        //     "#${controller.orders[orderIndex].parcels[wayIndex].id}",
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 13.sp,
        //       fontWeight: FontWeight.w300,
        //     ),
        //   ),
        // ),
        // const Spacer(),
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              controller
                  .orders[orderIndex].parcels[wayIndex].status.capitalize!,
              style: TextStyle(
                color: controller.orders[orderIndex].parcels[wayIndex].status ==
                        'pending'
                    ? Colors.redAccent
                    : Colors.green,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        )
      ],
    );
  }
}
