import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_divider.dart';
import 'package:mengo_delivery/components/custom_text.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:mengo_delivery/helpers/snackbar_helper.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../routes/app_pages.dart';
import 'create_order_way_count_widget.dart';

class CreateOrderToWidget extends StatelessWidget {
  final SenderController senderController;
  final ReceiverController receiverController;
  const CreateOrderToWidget(
      {super.key,
      required this.senderController,
      required this.receiverController});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListTile(
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(30)),
            child: const CustomText(
              text: "To",
              color: Colors.white,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Deliver to:",
              ),
              CreateOrderWayCountWidget(
                controller: receiverController,
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (receiverController.wayHistories.isNotEmpty)
                  ...receiverController.wayHistories.map((wayHistory) {
                    // Return a widget for each parcel
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text:
                                    "Way ${receiverController.wayHistories.indexOf(wayHistory) + 1} : ${wayHistory.parcelModel.receiver.name}"),
                            Flexible(
                              child: IconButton(
                                  onPressed: () {
                                    // print("called");
                                    receiverController.removeWayHistoryAtIndex(
                                        receiverController.wayHistories
                                            .indexOf(wayHistory));
                                  },
                                  icon: const Icon(Icons.close)),
                            ),
                          ],
                        ),
                        const CustomDivider(
                          color: Colors.black,
                          thickness: 0.4,
                        ),
                      ],
                    );
                  }).toList(),
                if (receiverController.parcels.isEmpty)
                  InkWell(
                    onTap: () {
                      if (senderController.sender.cityId != 0 &&
                          senderController.sender.name.isNotEmpty) {
                        Get.toNamed(Routes.recipient);
                      } else {
                        SnackBarHelper.showErrorMessage(
                            context: context,
                            title: "Please Fill Sender Info First");
                      }
                    },
                    child: Column(
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
                          thickness: 0.4,
                        ),
                      ],
                    ),
                  ),
                const CustomVerticalSpacer(height: 8),
                GestureDetector(
                  onTap: () {
                    if (senderController.sender.cityId != 0 &&
                        senderController.sender.name.isNotEmpty &&
                        receiverController.parcels.isNotEmpty) {
                      Get.toNamed(Routes.recipient);
                    }
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
        ));
  }
}
