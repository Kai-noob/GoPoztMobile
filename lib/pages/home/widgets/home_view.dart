import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return Obx(
      () => ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          const AppHeader(),
          const SizedBox(height: 5),
          const HomeCarouselSlider(adsBanners: []),
          const SizedBox(height: 17),
          OnlineShopsGrid(controller: controller),
          const SizedBox(height: 17),
          AnnouncementsSection(controller: controller),
        ],
      ),
    );
  }
}
