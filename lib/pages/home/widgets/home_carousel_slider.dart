import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/pages/ads/ads_page.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

import '../../../models/ads_model.dart';

class HomeCarouselSlider extends StatefulWidget {
  final List<Advertisement> adsBanners;

  const HomeCarouselSlider({super.key, required this.adsBanners});

  @override
  _HomeCarouselSliderState createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.h, vertical: 8.w),
      child: widget.adsBanners.isEmpty
          ? Container(
              height: 120.h,
              alignment: Alignment.center,
              child: const Text("No Ads"),
            )
          : Container(
              height: 120.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          widget.adsBanners[0].image)),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(
                horizontal: 7.0,
              ),
            ),
    );
  }
}
