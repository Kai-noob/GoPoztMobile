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
      onTap: () {
        Get.toNamed(Routes.delivery,
            arguments: {'partner_id': delivererModel.id, 'isPartner': true});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                delivererModel.profile ?? "",
              )),
              border: Border.all(color: primaryColor, width: 1.4),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 45.h,
            width: 45.h,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 66.h, maxWidth: 70.w),
            child: Text(
              delivererModel.name,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
