import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:selector_wheel/selector_wheel.dart';

import '../../../../components/city_area_background.dart';
import '../../../../controllers/delivery_controller.dart';
import '../../../../models/city_model.dart';
import '../../../../models/township_model.dart';
import '../../../../utils/app_colors.dart';

class ReceiverCityAreaWidget extends StatelessWidget {
  final SenderController senderController;
  final ReceiverController receiverController;
  const ReceiverCityAreaWidget(
      {super.key,
      required this.senderController,
      required this.receiverController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSelectCityAreaWidget(context, receiverController),
      child: SizedBox(
        height: 35.h,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Expanded(
                    flex: 5,
                    child: Text(
                      receiverController.receiverCityName.isNotEmpty ||
                              receiverController
                                  .receiverTownshipName.isNotEmpty ||
                              receiverController.receiverCityId != 0 ||
                              receiverController.receiverTownshipId != 0
                          ? "${receiverController.receiverCityName}/${receiverController.receiverTownshipName}"
                          : "City/Township",
                      style: TextStyle(
                          color: black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                receiverController.receiverCityName.isNotEmpty ||
                        receiverController.receiverTownshipName.isNotEmpty ||
                        receiverController.receiverCityId != 0 ||
                        receiverController.receiverTownshipId != 0
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
            )),
      ),
    );
  }

  showSelectCityAreaWidget(
      BuildContext context, ReceiverController controller) {
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
                              children: receiverController.cities
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          controller.getReceiverTownships(
                                              senderController.senderCityId,
                                              e.id);
                                          controller.selectReceiverCity(
                                              e.id, e.name);
                                          controller.selectReceiverTownship(
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
                                                                .receiverCityId ==
                                                            e.id &&
                                                        controller
                                                                .receiverCityName ==
                                                            e.name
                                                    ? primaryColor
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                  color: controller
                                                                  .receiverCityId ==
                                                              e.id &&
                                                          controller
                                                                  .receiverCityName ==
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
                              children: controller.avaliableWays
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          controller.selectReceiverTownship(
                                              e.township.id, e.township.name);
                                          controller.getDeliFees(
                                              controller.receiverCityId,
                                              senderController.senderCityId,
                                              e.township.id);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            decoration: BoxDecoration(
                                                color: controller
                                                                .receiverTownshipId ==
                                                            e.township.id &&
                                                        controller
                                                                .receiverTownshipName ==
                                                            e.township.name
                                                    ? primaryColor
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              e.township.name,
                                              style: TextStyle(
                                                  color: controller
                                                                  .receiverTownshipId ==
                                                              e.township.id &&
                                                          controller
                                                                  .receiverTownshipName ==
                                                              e.township.name
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
