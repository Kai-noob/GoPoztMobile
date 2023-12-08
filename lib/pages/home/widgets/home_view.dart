import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/components/my_widgets_animator.dart';
import 'package:mengo_delivery/models/ads_model.dart';
import 'package:mengo_delivery/pages/home/widgets/online_shop_card.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

import '../../../controllers/home_controller.dart';
import 'announcement_section.dart';
import 'app_header.dart';
import 'home_carousel_slider.dart';
import 'online_shop_grid.dart';

class HomeView extends StatelessWidget {
  final HomeController controller;

  const HomeView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator( onRefresh: ()async{
      controller.getData();
    },child: ListView(
      children: [
        const AppHeader(),
        const CustomVerticalSpacer(height: 5),
        HomeCarouselSlider(adsBanners: controller.advertisements),
        const CustomVerticalSpacer(height: 17),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Deliver with our partners",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        const CustomVerticalSpacer(height: 20),
        // OnlineShopsGrid(controller: controller),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 13.w),
            height: 160.h,
            child: GridView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              children: controller.deliverers
                  .take(8)
                  .map((e) => OnlineShopCard(delivererModel: e))
                  .toList(),
            )),
        const CustomVerticalSpacer(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Announcements",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const CustomVerticalSpacer(height: 10),
        AnnouncementsSection(controller: controller),
      ],
    ),);
  }
}
