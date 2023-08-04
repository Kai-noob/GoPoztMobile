import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/components/appbar_widget.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Notifications",
        isBackIconShow: false,
        onBackIconPressed: () {},
      ),
      body: ListView(padding: AppConstants.defaultPadding, children: [
        ListTile(
          leading: CircleAvatar(
              backgroundColor: primaryColor.withOpacity(0.4),
              child: AppConstants.notiIcon),
          subtitle: Text(
            "12-2-2023 9:00AM",
            style: TextStyle(
              fontSize: 12.0.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Order ကို အောင်မြင်စွာပို့ဆောင်ပီးပါပီဗျ",
            style: primaryTextStyle(
                color: blackColor, size: 13, weight: FontWeight.bold),
          ),
        ),
        const Divider(
          color: grey,
          // endIndent: 20,
          // indent: 20,
        ),
        ListTile(
          leading: CircleAvatar(
              backgroundColor: primaryColor.withOpacity(0.4),
              child: AppConstants.notiIcon),
          subtitle: Text(
            "12-2-2023 9:00AM",
            style: TextStyle(
              fontSize: 12.0.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          title: Text(
            "သင့်ရဲ့အကောင့်ကိုအောင်မြင်စွာဖောက်ပီးပါပီ",
            style: primaryTextStyle(
                color: blackColor, size: 13, weight: FontWeight.bold),
          ),
        ),
        const Divider(
          color: grey,
          // endIndent: 20,
          // indent: 20,
        ),
        ListTile(
          leading: CircleAvatar(
              backgroundColor: primaryColor.withOpacity(0.4),
              child: AppConstants.notiIcon),
          subtitle: Text(
            "12-2-2023 9:00AM",
            style: TextStyle(
              fontSize: 12.0.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          title: Text(
            "ကျေးဇူးအများကြီးတင်ပါသည်။",
            style: primaryTextStyle(
                color: blackColor, size: 13, weight: FontWeight.bold),
          ),
        ),
        const Divider(
          color: grey,
          // endIndent: 20,
          // indent: 20,
        ),
      ]),
    );
  }
}
