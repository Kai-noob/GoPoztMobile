import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/models/ads_model.dart';
import 'package:mengo_delivery/models/announcement_model.dart';
import 'package:path/path.dart';

import '../../utils/app_colors.dart';

class AdsPage extends StatelessWidget {
  final Advertisement advertisement;
  const AdsPage({super.key, required this.advertisement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(onTap: () {
          Get.back();
        }),
        title: const Text("Announcement"),
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Text(
            advertisement.name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 1.4),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 200.h,
          width: 150.w,
          child: CachedNetworkImage(
            imageUrl: advertisement.image ?? "",
            fit: BoxFit.cover,
            placeholder: (context, url) => const Icon(Icons.image),
            errorWidget: (context, url, error) => const Icon(Icons.image),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Text(
            advertisement.description,
            style: TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ]),
    );
  }
}
