import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';


class DeliveryNavBarEstimationWidget extends StatelessWidget {
  const DeliveryNavBarEstimationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Estimation",
                  style: TextStyle(
                      color: black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
                4.verticalSpace,
                Text(
                  "MMK-",
                  style: TextStyle(
                      color: black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  LineIcons.caret_up,
                  color: Colors.black,
                  size: 20,
                ),
                Text(
                  "Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}