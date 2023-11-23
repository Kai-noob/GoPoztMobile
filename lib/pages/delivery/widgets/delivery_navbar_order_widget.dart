import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/models/create_order_model.dart';
import 'package:mengo_delivery/models/parcel_model.dart';

import 'package:mengo_delivery/models/sender_model.dart';

import '../../../controllers/sender_controller.dart';
import '../../../models/receiver_model.dart';
import '../../../utils/app_colors.dart';

class DeliveryNavBarOrderWidget extends StatelessWidget {
  final DeliveryController controller;
  final SenderModel sender;
  final List<ParcelModel> parcels;
  final bool? isPartner;
  final int? partnerId;
  const DeliveryNavBarOrderWidget(
      {super.key,
      required this.controller,
      required this.sender,
      required this.parcels,
      required this.isPartner,
      required this.partnerId
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            if(isPartner==true){
    controller.createPartnerOrder(context, sender, parcels,partnerId);
            }else{
                  controller.createOrder(context, sender, parcels);
            }
            Get.delete<SenderController>(force: true);
            Get.delete<ReceiverController>(force: true);
            Get.delete<DeliveryController>(force: true);
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: primaryColor),
            child: Text(
              "Order now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
