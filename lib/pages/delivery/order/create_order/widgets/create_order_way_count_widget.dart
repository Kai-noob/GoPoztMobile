import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateOrderWayCountWidget extends StatelessWidget {
  const CreateOrderWayCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: blackColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        "WAY 1",
        style: TextStyle(color: white, fontSize: 12.sp),
      ),
    );
  }
}