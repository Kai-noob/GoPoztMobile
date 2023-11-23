import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconoir_flutter/media_image.dart';
import 'package:mengo_delivery/models/deliverer_model.dart';

import '../../../models/online_shop_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';

class OnlineShopCard extends StatelessWidget {
  final DelivererModel delivererModel;

  const OnlineShopCard({super.key, required this.delivererModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Get.toNamed(Routes.delivery,arguments: {
              'partner_id':delivererModel.id,
              'isPartner':true
            });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 1.4),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 30.h,
        width: 30.h,
        child: CachedNetworkImage(
          imageUrl: delivererModel.profile ?? "",
          placeholder: (context, url) => const Icon(Icons.image),
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.image),
        ),
      ),
    );
  }
}
