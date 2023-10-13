import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_divider.dart';
import 'package:mengo_delivery/components/custom_text.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

import '../../../../../routes/app_pages.dart';

class CreateOrderFromWidget extends StatelessWidget {
  const CreateOrderFromWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.sender),
      leading: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(30)),
        child: const CustomText(
          text: "From",
          color: Colors.white,
        ),
      ),
      title: const CustomText(
        text: "Collect From:",
      ),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Add sender address",
            ),
            CustomDivider(
              color: Colors.black,
              thickness: 0.8,
            ),
          ],
        ),
      ),
      // trailing: const Icon(Icons.edit_location_outlined),
    );
  }
}
