import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class ReceiverWayCountWidget extends StatelessWidget {
  const ReceiverWayCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        width: 100,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "WAY 1",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
