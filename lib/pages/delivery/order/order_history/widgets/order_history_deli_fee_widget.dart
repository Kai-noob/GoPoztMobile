import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryDeliFeeWidget extends StatelessWidget {
  const OrderHistoryDeliFeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        30.horizontalSpace,
        Text(
          "Deli fees-2500MMK",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        15.horizontalSpace,
        Text(
          "Normal",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
