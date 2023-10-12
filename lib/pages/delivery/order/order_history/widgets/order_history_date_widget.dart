import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryDateWidget extends StatelessWidget {
  const OrderHistoryDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Text(
        "Mon/12-4-2023",
        style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
