import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:carousel_slider/carousel_slider.dart';
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
            : AspectRatio(
                aspectRatio: 16 / 9,
                child: CarouselSlider.builder(
                  itemCount: widget.adsBanners.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return InkWell(
                      onTap: () {
                        // Get.to(() => FullImageView(
                        //     image: widget.adsBanners[index].imageUrl));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                    widget.adsBanners[index].image)),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7.0,
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 0.7,
                    // enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),
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
