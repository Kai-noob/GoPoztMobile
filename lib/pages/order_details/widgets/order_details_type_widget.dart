import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class ODTypeWidget extends StatelessWidget {
  const ODTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Theme.of(context).cardColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            6.verticalSpace,
            Text(
              "Type: Electronic Devices",
              style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp),
            ),
            6.verticalSpace,
            Text(
              "Size: sm",
              style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp),
            ),
            6.verticalSpace,
            Text(
              "Weight:3kg",
              style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
