import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../models/order_model.dart';

class OrderDetailsIdWidget extends StatelessWidget {
  const OrderDetailsIdWidget({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Text(
        "Order id:#${order.id}",
        style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
