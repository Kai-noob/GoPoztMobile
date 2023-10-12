import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:iconoir_flutter/media_image.dart';

import 'package:mengo_delivery/controllers/home_controller.dart';


import 'package:mengo_delivery/utils/app_colors.dart';

import '../../models/announcement_model.dart';

import 'widgets/home_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeView(controller: _controller),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementCard({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 1.4),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 30.h,
      width: 150.w,
      child: CachedNetworkImage(
        imageUrl: announcement.image ?? "",
        fit: BoxFit.cover,
        placeholder: (context, url) => const MediaImage(),
      ),
    );
  }
}
