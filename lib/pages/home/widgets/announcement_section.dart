import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/pages/announcements/announcement_page.dart';

import '../../../controllers/home_controller.dart';
import 'announcement_card.dart';

class AnnouncementsSection extends StatelessWidget {
  final HomeController controller;

  const AnnouncementsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.announcements.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => Get.to(() => AnnouncementPage(
                announcement: controller.announcements[index])),
            child:
                AnnouncementCard(announcement: controller.announcements[index]),
          );
        },
      ),
    );
  }
}
