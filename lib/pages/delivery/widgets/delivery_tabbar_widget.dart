import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

class DeliveryTabBarWidget extends StatelessWidget {
  const DeliveryTabBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontFamily: GoogleFonts.poppins(
          color: Colors.black,
        ).fontFamily,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      tabs: const [
        Tab(
          text: "Delivery",
        ),
        Tab(
          text: "Order",
        ),
      ],
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      labelPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
      indicatorPadding: EdgeInsets.all(10.h),
    );
  }
}
