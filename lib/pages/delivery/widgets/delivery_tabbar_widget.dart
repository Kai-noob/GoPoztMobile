import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeliveryTabBarWidget extends StatelessWidget {
  const DeliveryTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.black,
        labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        tabs: const [
          Tab(
            text: "Delivery",
          ),
          Tab(
            text: "Order",
          )
        ]);
  }
}