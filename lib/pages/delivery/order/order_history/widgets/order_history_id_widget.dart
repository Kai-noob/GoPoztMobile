import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrderHistoryIdWidget extends StatelessWidget {
  const OrderHistoryIdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Text(
        "Order id:1234",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}