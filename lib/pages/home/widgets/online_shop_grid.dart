import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../controllers/home_controller.dart';
import 'online_shop_card.dart';

class OnlineShopsGrid extends StatelessWidget {
  final HomeController controller;

  const OnlineShopsGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      height: 140.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 35,
        ),
        itemCount: controller.onlineShops.length,
        itemBuilder: (BuildContext context, int index) {
          return OnlineShopCard(shop: controller.onlineShops[index]);
        },
      ),
    );
  }
}
