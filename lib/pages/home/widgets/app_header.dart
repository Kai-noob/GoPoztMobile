import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconoir_flutter/bell.dart';
import 'package:iconoir_flutter/headset.dart';
import 'package:mengo_delivery/pages/notification/notification_page.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 5),
        child: Row(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(100),
            //   child: Image.asset(
            //     "assets/icons/logo.png",
            //     height: 30.h,
            //   ),
            // ),
            Text(
              "Delivery Hub",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(
              icon: const Headset(
                color: Colors.white,
              ),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
              icon: const Bell(
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(() => const NotificationPage());
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
