import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/models/city_model.dart';
import 'package:mengo_delivery/models/township_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:selector_wheel/selector_wheel.dart';

import '../../../../components/city_area_background.dart';

class SenderCityAreaWidget extends StatelessWidget {
  final DeliveryController controller;
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
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 32,
                    )
                  ],
                ),
              )),
        ));
  }

  showSelectCityAreaWidget(
      BuildContext context, DeliveryController controller) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return CityAreaBackground(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            secondaryContainer: Colors.amber,
                          ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "City",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: SelectorWheel<City>(
                            width: 150.0,
                            childCount: controller.cities.length,
                            childHeight: 45,
                            selectedItemIndex: (controller.senderCityId != 0 &&
                                    controller.senderCityName.isNotEmpty)
                                ? controller.cities.indexWhere((city) =>
                                            city.id ==
                                            controller.senderCityId) >=
                                        0
                                    ? controller.cities.indexWhere((city) =>
                                        city.id == controller.senderCityId)
                                    : null
                                : (controller.cities.isNotEmpty)
                                    ? 0
                                    : null,
                            highlightBorderRadius: BorderRadius.circular(4.0),
                            convertIndexToValue: (int index) {
                              City city = controller.cities[index];

                              return SelectorWheelValue(
                                label: city.name,
                                value: city,
                                index: index,
                              );
                            },
                            onValueChanged: (SelectorWheelValue<City> value) {
                              controller.getTownships(value.value.id);
                              controller.selectSenderCity(
                                  value.value.id, value.value.name);
                              controller.selectSenderTownship(0, "");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                    width: 32.0,
                    child: VerticalDivider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.grey,
                      thickness: 0.4,
                    )),
                Obx(
                  () => Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            secondaryContainer: Colors.amber,
                          ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Township",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: SelectorWheel<Township>(
                            width: 150.0,
                            childCount: controller.townships.length,
                            childHeight: 45,
                            selectedItemIndex: (controller.senderTownshipId !=
                                        0 &&
                                    controller.senderTownshipName.isNotEmpty)
                                ? controller.townships.indexWhere((township) =>
                                    township.id == controller.senderTownshipId)
                                : (controller.townships.isNotEmpty
                                    ? controller.townships[0].id
                                    : null),
                            highlightBorderRadius: BorderRadius.circular(4.0),
                            convertIndexToValue: (int index) {
                              Township township = controller.townships[index];

                              return SelectorWheelValue(
                                label: township.name,
                                value: township,
                                index: index,
                              );
                            },
                            onValueChanged:
                                (SelectorWheelValue<Township> value) {
                              // ignore: avoid_print
                              print(value);
                              controller.selectSenderTownship(
                                  value.value.id, value.value.name);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
