import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';

class ReceiverParcelSizeWidget extends StatelessWidget {
  final ReceiverController controller;
  const ReceiverParcelSizeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GestureDetector(
        onTap: () => _openParcelSize(context, controller),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                controller.parcelSize.isEmpty
                    ? "Parcel Size"
                    : controller.parcelSize,
                style: TextStyle(
                    color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down_outlined,
              size: 32,
            )
          ],
        ),
      ),
    );
  }

  void _openParcelSize(BuildContext context, ReceiverController controller) {
    showBarModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Obx(() => SizedBox(
              height: 200.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Parcel Size",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setParcelSize("sm");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: controller.parcelSize == "sm"
                                  ? primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.parcelSize == "sm"
                                      ? primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "sm",
                            style: TextStyle(
                                color: controller.parcelSize == "sm"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      GestureDetector(
                        onTap: () => controller.setParcelSize("md"),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: controller.parcelSize == "md"
                                  ? primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.parcelSize == "md"
                                      ? primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "md",
                            style: TextStyle(
                                color: controller.parcelSize == "md"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      GestureDetector(
                        onTap: () => controller.setParcelSize("lg"),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: controller.parcelSize == "lg"
                                  ? primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.parcelSize == "lg"
                                      ? primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "lg",
                            style: TextStyle(
                                color: controller.parcelSize == "lg"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
