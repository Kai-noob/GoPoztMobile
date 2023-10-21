import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_divider.dart';
import 'package:mengo_delivery/components/custom_text.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

import '../../../../../routes/app_pages.dart';

class CreateOrderFromWidget extends StatelessWidget {
  final DeliveryController controller;
  const CreateOrderFromWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    print("Controller ${controller.sender}");
    return Obx(() => ListTile(
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
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: controller.sender.name.isNotEmpty &&
                          controller.senderCityId != 0
                      ? "Sender Address: ${controller.senderCityName} ${controller.senderTownshipName}"
                      : "Add sender address",
                ),
                const CustomDivider(
                  color: Colors.black,
                  thickness: 0.8,
                ),
              ],
            ),
          ),
          // trailing: const Icon(Icons.edit_location_outlined),
        ));
  }
}
