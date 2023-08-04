import 'package:flutter/material.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

class DeliveryInstructionWidget extends StatelessWidget {
  const DeliveryInstructionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "လမ်းညွှန်ချက်များ",
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
