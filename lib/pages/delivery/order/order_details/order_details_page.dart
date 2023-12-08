import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_horizontal_spacer.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/models/order_model.dart';
import 'package:mengo_delivery/pages/delivery/order/order_details/widgets/order_details_date_widget.dart';
import 'package:mengo_delivery/pages/delivery/order/order_details/widgets/order_details_status_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';
import '../../../history/widgets/order_timeline.dart';
import 'widgets/order_details_id_widget.dart';

class OrderDetailsPage extends StatelessWidget {
  final List<Order> orders;
  final Order order;
  const OrderDetailsPage(
      {super.key, required this.orders, required this.order});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(onTap: () {
            Get.back();
          }),
          title: const Text("Details"),
        ),
        body: ListView(children: [
          const CustomVerticalSpacer(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OrderDetailsIdWidget(order: order),
                  // OrderDetailsStatusWidget(order: order)
                  OrderDetailsDateWidget(
                    order: order,
                  ),
                ]),
          ),
          order.deliverer == null
              ? Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Man",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Lottie.asset('assets/icons/search.json',
                              height: 45),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Name-",
                    //       style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 14.sp,
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //     const CustomVerticalSpacer(height: 5),
                    //     Lottie.asset('assets/icons/search.json', height: 45),
                    //   ],
                    // ),
                  ]),
                )
              : Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Man",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                            child: CircleAvatar(
                          radius: 40,
                          backgroundImage: CachedNetworkImageProvider(
                            order.deliverer!.profile,
                          ),
                        )),
                        const CustomHorizontalSpacer(width: 5),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Id.#${order.deliverer!.did}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              const CustomVerticalSpacer(height: 5),
                              Text(
                                order.deliverer!.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              // const Row(
                              //   children: [
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.yellow,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.yellow,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.yellow,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.yellow,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.yellow,
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        ),
                        // const Expanded(
                        //     child: Icon(
                        //   Icons.assignment_add,
                        //   color: Colors.black,
                        //   size: 40,
                        // )),
                        Expanded(
                            child: IconButton(
                          onPressed: () async {
                            await FlutterPhoneDirectCaller.callNumber(
                                order.deliverer!.phone);
                          },
                          icon: const Icon(
                            Icons.call,
                            color: Colors.black,
                            size: 40,
                          ),
                        ))
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        3.horizontalSpace,
                        Expanded(
                          flex: 3,
                          child: Text(
                            "${order.deliverer!.townships.name}(${order.deliverer!.city.name})",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Phone",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        3.horizontalSpace,
                        Expanded(
                          flex: 3,
                          child: Text(
                            order.deliverer!.phone,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    )
                  ]),
                ),
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sender Name:${order.sender.name}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "From ${order.sender.city.name}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Address",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  3.horizontalSpace,
                  Expanded(
                    flex: 3,
                    child: Text(
                      "${order.sender.street}.(${order.sender.township.name})",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Phone",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  3.horizontalSpace,
                  Expanded(
                    flex: 3,
                    child: Text(
                      order.sender.phone,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              )
            ]),
          ),
          10.verticalSpace,
          ...order.parcels
              .map((e) => InkWell(
                    onTap: () {
                      _showDialog(context, e);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 5),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Row(children: [
                          const CustomHorizontalSpacer(width: 10),
                          Text(
                            "Way ${order.parcels.indexOf(e) + 1} ",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            flex: 6,
                            child: Text(
                              "${e.receiver.city.name}/${e.receiver.township.name}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  _showDialog(context, e);
                                },
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 40,
                                ),
                              ))
                        ]),
                        // 10.verticalSpace,
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         "Address",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //     ),
                        //     3.horizontalSpace,
                        //     Expanded(
                        //       flex: 3,
                        //       child: Text(
                        //         "${e.receiver.street}.(${e.receiver.city.name})",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.normal),
                        //         textAlign: TextAlign.justify,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // 10.verticalSpace,
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         "Phone",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //     ),
                        //     3.horizontalSpace,
                        //     Expanded(
                        //       flex: 3,
                        //       child: Text(
                        //         e.receiver.phone,
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.normal),
                        //         textAlign: TextAlign.justify,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // 10.verticalSpace,
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         "Deli",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //     ),
                        //     3.horizontalSpace,
                        //     Expanded(
                        //       flex: 3,
                        //       child: Text(
                        //         "${e.deliveryTime.capitalize}",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.normal),
                        //         textAlign: TextAlign.justify,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // 10.verticalSpace,
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         "Item",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //     ),
                        //     3.horizontalSpace,
                        //     Expanded(
                        //       flex: 3,
                        //       child: Row(
                        //         children: [
                        //           Text(
                        //             e.itemType,
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 14.sp,
                        //                 fontWeight: FontWeight.normal),
                        //             textAlign: TextAlign.justify,
                        //           ),
                        //           8.horizontalSpace,
                        //           Text(
                        //             e.parcelSize,
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 14.sp,
                        //                 fontWeight: FontWeight.normal),
                        //             textAlign: TextAlign.justify,
                        //           ),
                        //           8.horizontalSpace,
                        //           Text(
                        //             "${e.parcelWeight}Kg",
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 14.sp,
                        //                 fontWeight: FontWeight.normal),
                        //             textAlign: TextAlign.justify,
                        //           ),
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // 10.verticalSpace,
                        // Row(
                        //   children: [
                        //     const Icon(
                        //       Icons.image,
                        //       size: 40,
                        //       color: Colors.black,
                        //     ),
                        //     const Icon(
                        //       Icons.image,
                        //       size: 40,
                        //       color: Colors.black,
                        //     ),
                        //     const Icon(
                        //       Icons.image,
                        //       size: 40,
                        //       color: Colors.black,
                        //     ),
                        //     Expanded(
                        //       flex: 2,
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.end,
                        //         children: [
                        //           Text(
                        //             "Deli Fees - ${e.parcelTotalAmount}MMK",
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 14.sp,
                        //                 fontWeight: FontWeight.w500),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ]),
                    ),
                  ))
              .toList(),
          CustomVerticalSpacer(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Text(
              "Order Status",
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          OrderTimeline(
            isFirst: true,
            isLast: false,
            isPast: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Placed",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                const CustomVerticalSpacer(height: 5),
                Text(
                  "Order successfully placed",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ),
          OrderTimeline(
            isFirst: true,
            isLast: false,
            isPast: order.status == 'assigned' ||
                    order.status == 'accepted' ||
                    order.status == 'picked' ||
                    order.status == 'completed'
                ? true
                : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Assigned",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                const CustomVerticalSpacer(height: 5),
                Text(
                  "Order confirmed and assigned to delivery person",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ),
          OrderTimeline(
            isFirst: true,
            isLast: false,
            isPast: order.status == 'accepted' ||
                    order.status == 'picked' ||
                    order.status == 'completed'
                ? true
                : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Accepted",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                const CustomVerticalSpacer(height: 5),
                Text(
                  "Order picked up and prepare for delivery ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ),
          OrderTimeline(
            isFirst: true,
            isLast: false,
            isPast: order.status == 'picked' || order.status == 'completed'
                ? true
                : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivering",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                const CustomVerticalSpacer(height: 5),
                Text(
                  "Order is on its way and will be reaching you shortly",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ),
          OrderTimeline(
            isFirst: true,
            isLast: true,
            isPast: order.status == 'completed' ? true : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Completed",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                const CustomVerticalSpacer(height: 5),
                Text(
                  "Order is successfully delivered",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  _showDialog(BuildContext context, Parcel parcel) {
    showBarModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFFF5F5F5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 50.h,
                          child: Text(
                            parcel.receiver.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 50.h,
                          child: Text(
                            parcel.receiver.phone,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    OrderTimeline(
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pending",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          ),
                          const CustomVerticalSpacer(height: 5),
                          Text(
                            "Order successfully placed",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    OrderTimeline(
                      isFirst: true,
                      isLast: false,
                      isPast: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivering",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          ),
                          const CustomVerticalSpacer(height: 5),
                          Text(
                            "Order confirmed and assigned to delivery person",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    OrderTimeline(
                      isFirst: true,
                      isLast: true,
                      isPast: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Completed",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          ),
                          const CustomVerticalSpacer(height: 5),
                          Text(
                            "Order picked up and prepare for delivery ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                alignment: Alignment.center,
                                child: Text(
                                  "Amount-${parcel.parcelTotalAmount}MMK",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration:
                                    const BoxDecoration(color: primaryColor),
                                alignment: Alignment.center,
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
