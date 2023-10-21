import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconoir_flutter/headset.dart';
import 'package:iconoir_flutter/open_book.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          // Image.asset(
          //   "assets/icons/icon.png",
          //   height: 40.h,
          // ),
          Text(
            "MANGO",
            style: TextStyle(
                color: Colors.black,
                fontSize: 17.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          IconButton(
            icon: const Headset(),
            onPressed: () {},
            color: primaryColor,
          ),
          IconButton(
            icon: const OpenBook(),
            onPressed: () {},
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
