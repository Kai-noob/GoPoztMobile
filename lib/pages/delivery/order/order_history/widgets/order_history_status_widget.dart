import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrderHistoryStatusWidget extends StatelessWidget {
  const OrderHistoryStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Pending..",
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

