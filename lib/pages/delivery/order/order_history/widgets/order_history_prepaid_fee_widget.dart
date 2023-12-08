import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryPrepaidFeeWidget extends StatelessWidget {
  const OrderHistoryPrepaidFeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        30.horizontalSpace,
        Text(
          "Deli fees-2500MMK",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
