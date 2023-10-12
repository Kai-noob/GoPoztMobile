import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView(padding: AppConstants.defaultPadding, children: [
        ListTile(
          leading: CircleAvatar(
              backgroundColor: primaryColor.withOpacity(0.9),
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
                color: blackColor, size: 13, weight: FontWeight.w500),
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
