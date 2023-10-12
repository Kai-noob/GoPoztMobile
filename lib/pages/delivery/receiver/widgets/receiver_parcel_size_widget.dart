import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';

class ReceiverParcelSizeWidget extends StatelessWidget {
  final DeliveryController controller;
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
                    color: black, fontSize: 13.sp, fontWeight: FontWeight.w500),
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

  void _openParcelSize(BuildContext context, DeliveryController controller) {
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
                          controller.setParcelSize("Sm");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: controller.parcelSize == "Sm"
                                  ? primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.parcelSize == "Sm"
                                      ? primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Sm",
                            style: TextStyle(
                                color: controller.parcelSize == "Sm"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      GestureDetector(
                        onTap: () => controller.setParcelSize("m"),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: controller.parcelSize == "m"
                                  ? primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.parcelSize == "m"
                                      ? primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "m",
                            style: TextStyle(
                                color: controller.parcelSize == "m"
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
