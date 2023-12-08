import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconoir_flutter/media_image.dart';

import '../../../models/announcement_model.dart';
import '../../../utils/app_colors.dart';

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
          image: DecorationImage(
              image: CachedNetworkImageProvider(announcement.image ?? ""),
              fit: BoxFit.cover)),
      height: 30.h,
      width: 150.w,
    );
  }
}
