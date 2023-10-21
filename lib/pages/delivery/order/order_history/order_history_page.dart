import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mengo_delivery/components/custom_divider.dart';

import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../../../network/api_call_status.dart';
import '../../../../utils/app_colors.dart';
import 'widgets/order_history_cancel_button_widget.dart';
import 'widgets/order_history_date_widget.dart';
import 'widgets/order_history_deli_fee_widget.dart';
import '../order_details/order_details_page.dart';
import 'widgets/order_history_delivery_id_widget.dart';
import 'widgets/order_history_id_widget.dart';
import 'widgets/order_history_phone_call_widget.dart';
import 'widgets/order_history_prepaid_fee_widget.dart';
import 'widgets/order_history_status_widget.dart';
import 'widgets/order_history_way_widget.dart';
import 'widgets/order_history_search_field_widget.dart';

class OrderHistoryPage extends StatelessWidget {
  final DeliveryController controller;
  const OrderHistoryPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomVerticalSpacer(height: 20),
        const OrderHistorySearchFieldWidget(),
        const CustomVerticalSpacer(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: controller.orders.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    const CustomVerticalSpacer(height: 10),
                    InkWell(
                      onTap: () {
                        Get.to(() => const OrderDetailsPage());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          Row(
                            children: [
                              OrderHistoryIdWidget(
                                index: index,
                                controller: controller,
                              ),
                              const Spacer(),
                              OrderHistoryDateWidget(
                                index: index,
                                controller: controller,
                              ),
                              const Spacer(),
                              OrderHistoryStatusWidget(
                                controller: controller,
                                index: index,
                              )
                            ],
                          ),
                          const CustomVerticalSpacer(height: 5),
                          const Row(
                            children: [
                              Expanded(child: Icon(LineIcons.bicycle)),
                              OrderHistoryDeliveryIdWidget(),
                              OrderHistoryPhoneCallWidget(),
                              OrderHistoryCancelWidget(),
                            ],
                          ),
                          const CustomVerticalSpacer(height: 5),
                          const CustomDivider(
                              color: Colors.black,
                              thickness: 0.8,
                              endIndent: 15,
                              indent: 15),
                          ...controller.orders[index].parcels
                              .map((e) => Column(
                                    children: [
                                      OrderHistoryWayWidget(
                                        controller: controller,
                                        index: controller.orders[index].parcels
                                            .indexOf(e),
                                      ),
                                      const SizedBox(height: 10),
                                      const OrderHistoryDeliFeeWidget(),
                                      const CustomVerticalSpacer(height: 4),
                                      const OrderHistoryPrepaidFeeWidget(),
                                      const CustomDivider(
                                          color: Colors.black,
                                          thickness: 0.8,
                                          endIndent: 15,
                                          indent: 15),
                                    ],
                                  ))
                              .toList(),
                        ]),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
