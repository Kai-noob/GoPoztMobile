import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/app_constants.dart';

class HomeServiceChargeWidget extends StatelessWidget {
  const HomeServiceChargeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: black, width: 0.3),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      padding: AppConstants.defaultPadding,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/burmese-kyat.png",
            height: 26,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            "ဝန်ဆောင်မှုနှုန်းထားများ",
            style: boldTextStyle(color: blackColor, size: 13),
          ),
        ],
      ),
    );
  }
}
