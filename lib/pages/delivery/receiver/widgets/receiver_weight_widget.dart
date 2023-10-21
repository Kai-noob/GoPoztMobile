import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:nb_utils/nb_utils.dart';

class ReceiverWeightWidget extends StatelessWidget {
  const ReceiverWeightWidget({
    super.key,
    required this.controller,
  });

  final DeliveryController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Weight",
                style: TextStyle(
                    color: black, fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.decreaseWeight(),
                    child: const Icon(
                      Icons.remove,
                      size: 20,
                    ),
                  ),
                  4.horizontalSpace,
                  Text(
                    controller.parcelWeight.toString(),
                    style: TextStyle(
                        color: black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  4.horizontalSpace,
                  GestureDetector(
                    onTap: () => controller.increseWeight(),
                    child: const Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
