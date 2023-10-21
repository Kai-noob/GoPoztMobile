import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconoir_flutter/media_image.dart';

import '../../../models/online_shop_model.dart';
import '../../../utils/app_colors.dart';

class OnlineShopCard extends StatelessWidget {
  final OnlineShop shop;

  const OnlineShopCard({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.4),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 30.h,
      width: 30.h,
      child: CachedNetworkImage(
        imageUrl: shop.logo ?? "",
        placeholder: (context, url) => const Icon(Icons.image),
        errorWidget: (context, url, error) => const Icon(Icons.image),
      ),
    );
  }
}
