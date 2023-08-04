import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class DeliveryLimitOrdersWidget extends StatelessWidget {
  const DeliveryLimitOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.defaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ကန့်သတ်ပစ္စည်းများ",
            style: boldTextStyle(
                color: blackColor, size: 13, weight: FontWeight.normal),
          ),
          Text(
            "ကြည့်မည်",
            style: boldTextStyle(
                color: primaryColor, size: 14, weight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
