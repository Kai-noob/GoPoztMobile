import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../controllers/delivery_controller.dart';
import '../../../../../utils/app_colors.dart';

class OrderHistoryWayWidget extends StatelessWidget {
  final int index;
  final DeliveryController controller;
  const OrderHistoryWayWidget({
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "Way ${controller.orders[index].parcels.length} ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 5,
          child: Text(
            "YANGON/Bahan",
            style: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 4,
          child: Text(
            "#P0002",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Pending..",
              style: TextStyle(
                color: Colors.black,
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
