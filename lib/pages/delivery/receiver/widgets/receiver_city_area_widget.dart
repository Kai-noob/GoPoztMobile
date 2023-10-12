import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:selector_wheel/selector_wheel.dart';

import '../../../../components/city_area_background.dart';
import '../../../../controllers/delivery_controller.dart';
import '../../../../models/city_model.dart';
import '../../../../models/township_model.dart';

class ReceiverCityAreaWidget extends StatelessWidget {
  final DeliveryController controller;
  const ReceiverCityAreaWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSelectCityAreaWidget(context, controller),
      child: SizedBox(
        height: 35.h,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.receiverCityName.isNotEmpty ||
                            controller.receiverTownshipName.isNotEmpty ||
                            controller.receiverCityId != 0 ||
                            controller.receiverTownshipId != 0
                        ? "${controller.receiverCityName}/${controller.receiverTownshipName}"
                        : "City/Township",
                    style: TextStyle(
                        color: black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 32,
                )
              ],
            )),
      ),
    );
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
                Theme(
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
                            controller.selectReceiverCity(
                                value.value.id, value.value.name);
                            controller.selectReceiverTownship(0, "");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    width: 32.0,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.4,
                    )),
                Obx(() => Theme(
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
                              selectedItemIndex: controller.townships.isNotEmpty
                                  ? controller.townships[0].id
                                  : null,
                              highlightBorderRadius: BorderRadius.circular(4.0),
                              convertIndexToValue: (int index) {
                                print(index);
                                // controller.selectReceiverTownship(
                                //     controller.townships[index].id,
                                //     controller.townships[index].name);
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
                                controller.selectReceiverTownship(
                                    value.value.id, value.value.name);
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
