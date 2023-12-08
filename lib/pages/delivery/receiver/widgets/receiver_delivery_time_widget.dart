import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../sender/widgets/sender_clear_all_widget.dart';
import '../../sender/widgets/sender_confirm_widget.dart';

class ReceiverDeliveryTimeWidget extends StatelessWidget {
  final ReceiverController controller;
  const ReceiverDeliveryTimeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GestureDetector(
            onTap: () => _openDeliveryTime(context, controller),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.deliveryTime.isEmpty
                        ? "Delivery time"
                        : controller.deliveryTime.capitalize!,
                    style: TextStyle(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 32,
                )
              ],
            ),
          )),
    );
  }

  void _openDeliveryTime(BuildContext context, ReceiverController controller) {
    showBarModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Obx(() => SizedBox(
              height: 200.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  15.verticalSpace,
                  Text(
                    "Delivery Time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setDeliveryTime("urgent");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: controller.deliveryTime == "urgent"
                                  ? primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.deliveryTime == "urgent"
                                      ? primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Urgent",
                            style: TextStyle(
                                color: controller.deliveryTime == "urgent"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          controller.setDeliveryTime("normal");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: controller.deliveryTime == "normal"
                                  ? primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.deliveryTime == "normal"
                                      ? primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Normal",
                            style: TextStyle(
                                color: controller.deliveryTime == "normal"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                          SenderClearAllWidget(
                            label: "Cancel",
                            onTap: () {
                              controller.setDeliveryTime("");

                              Get.back();
                            },
                          ),
                        SenderConfirmWidget(
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
