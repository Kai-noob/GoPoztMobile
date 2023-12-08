import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconoir_flutter/refresh.dart';
import 'package:intl/intl.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';
import 'package:mengo_delivery/pages/delivery/order/order_history/widgets/order_history_delivery_id_widget.dart';
import 'package:mengo_delivery/pages/history/widgets/order_timeline.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/custom_divider.dart';
import '../../../components/custom_vertical_spacer.dart';
import '../../../models/order_model.dart';
import '../../delivery/order/order_details/order_details_page.dart';
import '../../delivery/order/order_history/widgets/order_history_cancel_button_widget.dart';
import '../../delivery/order/order_history/widgets/order_history_date_widget.dart';
import '../../delivery/order/order_history/widgets/order_history_deli_fee_widget.dart';
import '../../delivery/order/order_history/widgets/order_history_id_widget.dart';
import '../../delivery/order/order_history/widgets/order_history_phone_call_widget.dart';
import '../../delivery/order/order_history/widgets/order_history_prepaid_fee_widget.dart';
import '../../delivery/order/order_history/widgets/order_history_status_widget.dart';
import '../../delivery/order/order_history/widgets/order_history_way_widget.dart';

class HistoryCard extends GetView<OrdersController> {
  final VoidCallback refresh;
  final List<Order> orders;
  const HistoryCard({super.key, required this.orders, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        refresh();
      },
      child: ListView.builder(
        itemCount: orders.length,
        // shrinkWrap: true,
        // physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                // const CustomVerticalSpacer(height: 10),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderHistoryCommonWidget(
                            label: "Tracking Number",
                            controller: controller,
                          ),
                          Flexible(
                            flex: 2,
                            child: Text(
                              "#${orders[index].id.toString()}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const CustomVerticalSpacer(height: 9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderHistoryCommonWidget(
                            label: "Status",
                            controller: controller,
                          ),
                          Flexible(
                            flex: 2,
                            child: Text(
                              orders[index].status.capitalize!,
                              style: TextStyle(
                                color: orders[index].status == 'pending'
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 14.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const CustomVerticalSpacer(height: 9),
                      // const CustomDivider(
                      //     color: Colors.black,
                      //     thickness: 0.8,
                      //     endIndent: 15,
                      //     indent: 15),
                      // ...controller.orders[index].parcels
                      //     .map((e) => Column(
                      //           children: [
                      //             OrderHistoryWayWidget(
                      //               orderIndex: index,
                      //               controller: controller,
                      //               wayIndex: controller
                      //                   .orders[index].parcels
                      //                   .indexOf(e),
                      //             ),

                      //             // const OrderHistoryDeliFeeWidget(),
                      //             const CustomVerticalSpacer(height: 4),
                      //             const OrderHistoryPrepaidFeeWidget(),
                      //             const CustomDivider(
                      //                 color: Colors.black,
                      //                 thickness: 0.8,
                      //                 endIndent: 15,
                      //                 indent: 15),
                      //           ],
                      //         ))
                      //     .toList(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderHistoryCommonWidget(
                            label: "Date",
                            controller: controller,
                          ),
                          Flexible(
                            flex: 2,
                            child: Text(
                              DateFormat('dd-M-yyyy').format(
                                  DateTime.parse(orders[index].createdAt)),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const CustomVerticalSpacer(height: 9),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderHistoryCommonWidget(
                            label: "From",
                            controller: controller,
                          ),
                          Flexible(
                            flex: 2,
                            child: Text(
                              orders[index].sender.city.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const CustomVerticalSpacer(height: 9),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderHistoryCommonWidget(
                            label: "To",
                            controller: controller,
                          ),
                          Wrap(
                            children: orders[index]
                                .parcels
                                .map(
                                  (e) => Text(
                                    e.receiver.city.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                      const CustomVerticalSpacer(height: 9),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     OrderHistoryCommonWidget(
                      //       label: "Total Ways",
                      //       controller: controller,
                      //     ),
                      //     Flexible(
                      //       flex: 2,
                      //       child: Text(
                      //         "${orders[index].parcels.length.toString()}Way",
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 14.sp,
                      //           overflow: TextOverflow.ellipsis,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),

                      const CustomVerticalSpacer(height: 15),

                      Container(
                        height: 35.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Get.to(() => OrderDetailsPage(
                                    order: orders[index],
                                    orders: orders,
                                  ));
                            },
                            child: Text(
                              "Track Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            )),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
