import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/components/my_widgets_animator.dart';
import 'package:mengo_delivery/models/ads_model.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

import '../../../controllers/home_controller.dart';

import 'announcement_section.dart';
import 'app_header.dart';
import 'home_carousel_slider.dart';
import 'online_shop_grid.dart';

class HomeView extends StatelessWidget {
  final HomeController controller;

  const HomeView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AppHeader(),
        const CustomVerticalSpacer(height: 5),
        HomeCarouselSlider(adsBanners: controller.advertisements),
        const CustomVerticalSpacer(height: 17),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "ပို့ဆောင်ရန် ရွေးချယ်ပါ",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: primaryColor),
          ),
        ),
        const CustomVerticalSpacer(height: 10),
        OnlineShopsGrid(controller: controller),
        const CustomVerticalSpacer(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "ကြော်ငြာချက်များ",
            style: TextStyle(
                fontSize: 14.sp,
                color: primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        const CustomVerticalSpacer(height: 10),
        AnnouncementsSection(controller: controller),
      ],
    );
  }
}
