import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/models/order_model.dart';
import 'package:mengo_delivery/pages/delivery/order/order_details/widgets/order_details_date_widget.dart';
import 'package:mengo_delivery/pages/delivery/order/order_details/widgets/order_details_status_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';
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
        body: ListView(children: [
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: const BoxDecoration(color: primaryColor),
            child: Row(children: [
              OrderDetailsIdWidget(order: order),
              OrderDetailsDateWidget(
                order: order,
              ),
              15.horizontalSpace,
              OrderDetailsStatusWidget(order: order)
            ]),
          ),
          order.deliverer == null
              ? const SizedBox()
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
                              fontSize: 15.sp,
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
                        const Expanded(
                            child: Icon(
                          LineIcons.user_1,
                          color: Colors.black,
                          size: 40,
                        )),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Id.#D1000001",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Mg Mg",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Biker Junior",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                            child: Icon(
                          Icons.assignment_add,
                          color: Colors.black,
                          size: 40,
                        )),
                        const Expanded(
                            child: Icon(
                          Icons.call,
                          color: Colors.black,
                          size: 40,
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
                            "No.9 Aungchanthar 5.st Aung Chan Thar Quarter.(Yangon)",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
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
                            "09-783150477/09259158414",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
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
                    "Sender Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "(${order.sender.city.name})",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
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
                          fontSize: 12.sp,
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
                          fontSize: 12.sp,
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
              .map((e) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 5),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Way ${order.parcels.indexOf(e) + 1} ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          flex: 6,
                          child: Text(
                            "${e.receiver.city.name}/${e.receiver.township.name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "#${e.id}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        15.horizontalSpace,
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              e.status.capitalize!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ]),
                      10.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          3.horizontalSpace,
                          Expanded(
                            flex: 3,
                            child: Text(
                              "${e.receiver.street}.(${e.receiver.city.name})",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
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
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          3.horizontalSpace,
                          Expanded(
                            flex: 3,
                            child: Text(
                              e.receiver.phone,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
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
                              "Deli",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          3.horizontalSpace,
                          Expanded(
                            flex: 3,
                            child: Text(
                              "${e.deliveryTime.capitalize}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
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
                              "Item",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          3.horizontalSpace,
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Text(
                                  e.itemType,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.justify,
                                ),
                                8.horizontalSpace,
                                Text(
                                  e.parcelSize,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.justify,
                                ),
                                8.horizontalSpace,
                                Text(
                                  "${e.parcelWeight}Kg",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          const Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.black,
                          ),
                          const Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.black,
                          ),
                          const Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.black,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Deli Fees - ${e.parcelTotalAmount}MMK",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ]),
                  ))
              .toList()
        ]),
      ),
    );
  }
}
