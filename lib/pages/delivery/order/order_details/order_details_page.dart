import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';


class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

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
              Expanded(
                flex: 4,
                child: Text(
                  "Order id:#1234",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Expanded(
                child: Text(
                  "Mon/2-8-2023",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              15.horizontalSpace,
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Pending...",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ]),
          ),
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
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
                    "Sender Details(OS)",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "(YANGON)",
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
          10.verticalSpace,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "WAY 1",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  flex: 3,
                  child: Text(
                    "YANGON/Hlaing",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "#P0001",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                15.horizontalSpace,
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Pending...",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
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
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Deli",
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
                      "Urgent",
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  3.horizontalSpace,
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Text(
                          "Clothes",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.justify,
                        ),
                        8.horizontalSpace,
                        Text(
                          "Small",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.justify,
                        ),
                        8.horizontalSpace,
                        Text(
                          "1Kg",
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Deli Fees - 2500MMK",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Prepaid - 1500MMK",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
