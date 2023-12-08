import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/components/custom_horizontal_spacer.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateOrderTimeWidget extends StatelessWidget {
  const CreateOrderTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ListTile(
        tileColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Row(
          children: [
            const Icon(
              LineIcons.clock,
              color: Colors.black,
            ),
            const CustomHorizontalSpacer(width: 3),
            Text(
              "ပစ္စည်းလာယူချိန်",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        subtitle: Text(
          "ပုံမှန်အားဖြင့် (၂၄နာရီ) အတွင်းလာယူသည်။(စိတ်ကြိုက်ပြင်ဆင်နိုင်သည်။)",
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
