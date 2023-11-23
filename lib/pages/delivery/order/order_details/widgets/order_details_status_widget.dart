import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../models/order_model.dart';

class OrderDetailsStatusWidget extends StatelessWidget {
  final Order order;
  const OrderDetailsStatusWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "${order.status.capitalize}",
          style: TextStyle(
              color:
                  order.status == 'pending' ? Colors.white : Colors.greenAccent,
              fontSize: 15.sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
