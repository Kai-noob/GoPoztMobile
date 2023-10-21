import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../controllers/delivery_controller.dart';


class OrderHistoryStatusWidget extends StatelessWidget {
    final int index;
  final DeliveryController controller;
  
  const OrderHistoryStatusWidget({
    super.key, required this.index, required this.controller,
    
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          controller.orders[index].status.toUpperCase(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}

