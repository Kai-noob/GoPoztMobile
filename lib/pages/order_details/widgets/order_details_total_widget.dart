import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class ODTotalWidget extends StatelessWidget {
  const ODTotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total",
              style: TextStyle(
                  color: white, fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            4.verticalSpace,
            Text(
              "MMK-",
              style: TextStyle(
                  color: white, fontSize: 14.sp, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
