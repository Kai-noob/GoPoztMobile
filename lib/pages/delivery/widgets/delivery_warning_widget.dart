import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_images.dart';
import 'package:nb_utils/nb_utils.dart';

class DeliveryWarningWidget extends StatelessWidget {
  const DeliveryWarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Card(
        // clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black.withOpacity(0.5),

        shape: RoundedRectangleBorder(
          // side: BorderSide(color: blackColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 30.0,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SvgPicture.asset(deliveryMane, height: 40, color: blackColor),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ပစ္စည်းပို့ဆောင်ချိန်  {၂ရက် မှ ၃ရက်}",
                  style: primaryTextStyle(
                      color: blackColor, size: 13, weight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "နယ်သို့ ၅ ရက် အတွင်း \nအိမ်အရောက်ပို့ဆောင်ပေးပါသည်။",
                  style: primaryTextStyle(
                      color: blackColor, size: 13, weight: FontWeight.normal),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
