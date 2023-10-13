import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_divider.dart';
import 'package:mengo_delivery/components/custom_text.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../routes/app_pages.dart';
import 'create_order_way_count_widget.dart';

class CreateOrderToWidget extends StatelessWidget {
  const CreateOrderToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.recipient),
      leading: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(30)),
        child: const CustomText(
          text: "To",
          color: Colors.white,
        ),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: "Deliver to:",
          ),
          CreateOrderWayCountWidget(),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: "Add recipient address",
                ),
                InkWell(
                    onTap: () {},
                    child: const Icon(
                      LineIcons.times,
                      color: Colors.black,
                      size: 19,
                    ))
              ],
            ),
            const CustomDivider(
              color: Colors.black,
              thickness: 0.8,
            ),
            const CustomVerticalSpacer(height: 8),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.recipient);
              },
              child: const Row(
                children: [
                  CustomText(
                    text: "Add to way ",
                  ),
                  Icon(
                    Icons.add,
                    color: blackColor,
                    size: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // trailing: const Icon(Icons.edit_location_outlined),
    );
  }
}
