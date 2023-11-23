import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:mengo_delivery/models/city_model.dart';
import 'package:mengo_delivery/models/township_model.dart';
import 'package:mengo_delivery/pages/delivery/sender/widgets/sender_confirm_widget.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:selector_wheel/selector_wheel.dart';

import '../../../../components/city_area_background.dart';

class SenderCityAreaWidget extends StatelessWidget {
  final SenderController controller;
  const SenderCityAreaWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 35.h,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                onTap: () => showSelectCityAreaWidget(context, controller),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.senderCityName.isNotEmpty ||
                              controller.senderTownshipName.isNotEmpty ||
                              controller.senderCityId != 0 ||
                              controller.senderTownshipId != 0
                          ? "${controller.senderCityName}/${controller.senderTownshipName}"
                          : "City/Township",
                      style: TextStyle(
                          color: black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    controller.senderCityName.isNotEmpty ||
                            controller.senderTownshipName.isNotEmpty ||
                            controller.senderCityId != 0 ||
                            controller.senderTownshipId != 0
                        ? const Expanded(
                            child: Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 32,
                            ),
                          )
                        : const Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 32,
                          )
                  ],
                ),
              )),
        ));
  }

  showSelectCityAreaWidget(BuildContext context, SenderController controller) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return CityAreaBackground(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "City",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Obx(() => Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: controller.cities
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          controller.getSenderTownships(e.id);
                                          controller.selectSenderCity(
                                              e.id, e.name);
                                          controller.selectSenderTownship(
                                              0, "");
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            decoration: BoxDecoration(
                                                color: controller
                                                                .senderCityId ==
                                                            e.id &&
                                                        controller
                                                                .senderCityName ==
                                                            e.name
                                                    ? primaryColor
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                  color: controller
                                                                  .senderCityId ==
                                                              e.id &&
                                                          controller
                                                                  .senderCityName ==
                                                              e.name
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ))
                                  .toList(),
                            ),
                          ))),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Township",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Obx(() => Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: controller.townships
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          controller.selectSenderTownship(
                                              e.id, e.name);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            decoration: BoxDecoration(
                                                color: controller
                                                                .senderTownshipId ==
                                                            e.id &&
                                                        controller
                                                                .senderTownshipName ==
                                                            e.name
                                                    ? primaryColor
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                  color: controller
                                                                  .senderTownshipId ==
                                                              e.id &&
                                                          controller
                                                                  .senderTownshipName ==
                                                              e.name
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ))
                                  .toList(),
                            ),
                          ))),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
