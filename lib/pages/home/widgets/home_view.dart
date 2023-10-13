import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/components/my_widgets_animator.dart';
import 'package:mengo_delivery/models/ads_model.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      children: [
        const AppHeader(),
        const CustomVerticalSpacer(height: 5),
        HomeCarouselSlider(adsBanners: [
          AdsModel(
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fdepositphotos.com%2Fvector%2Fsummer-sale-web-banner-template-design-concept-website-design-advertising-275012978.html&psig=AOvVaw1RL9ia_K8PXC-1K5_s6Ttx&ust=1697247910853000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDkoqjz8YEDFQAAAAAdAAAAABAG")
        ]),
        const CustomVerticalSpacer(height: 17),
        Text(
          "OS Users",
          style: TextStyle(fontSize: 16.sp),
        ),
        const CustomVerticalSpacer(height: 10),
        OnlineShopsGrid(controller: controller),
        const CustomVerticalSpacer(height: 10),
        Text(
          "Announcements",
          style: TextStyle(fontSize: 16.sp),
        ),
        const CustomVerticalSpacer(height: 10),
        AnnouncementsSection(controller: controller),
      ],
    );
  }
}
