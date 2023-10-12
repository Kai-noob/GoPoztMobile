
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class ODImageWidget extends StatelessWidget {
  const ODImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
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
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 0),
          ),
        );
      },
      options: CarouselOptions(
        height: 100,
        autoPlay: true,
        reverse: true,
        padEnds: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.7,
        clipBehavior: Clip.none,
        // enableInfiniteScroll: true,
        // enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          // setState(() {
          //   _current = index;
          // });
        },
      ),
    );
  }
}