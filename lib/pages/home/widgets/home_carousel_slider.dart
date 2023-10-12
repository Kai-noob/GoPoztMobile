import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

import '../../../models/ads_model.dart';

class HomeCarouselSlider extends StatefulWidget {
  final List<AdsModel> adsBanners;

  const HomeCarouselSlider({super.key, required this.adsBanners});

  @override
  _HomeCarouselSliderState createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.adsBanners.isEmpty
            ? const Text("No Ads")
            : CarouselSlider.builder(
                itemCount: widget.adsBanners.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return InkWell(
                    onTap: () {
                      // Get.to(() => FullImageView(
                      //     image: widget.adsBanners[index].imageUrl));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/icons/banner.jpg")),
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7.0,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 90,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: 1,
                  // enableInfiniteScroll: true,
                  // enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.adsBanners.map((url) {
            int index = widget.adsBanners.indexOf(url);
            return Container(
              width: 10.0,
              height: 10.0,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey[400],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
