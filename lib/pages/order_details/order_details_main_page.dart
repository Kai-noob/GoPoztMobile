import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';

import 'package:nb_utils/nb_utils.dart';

import 'widgets/order_details_cancel_widget.dart';
import 'widgets/order_details_collect_payment_widget.dart';
import 'widgets/order_details_delivery_person_widget.dart';
import 'widgets/order_details_image_widget.dart';
import 'widgets/order_details_recipient_addres_widget.dart';
import 'widgets/order_details_sender_address_widget.dart';
import 'widgets/order_details_total_widget.dart';
import 'widgets/order_details_type_widget.dart';

class OrderDetailsMainPage extends StatelessWidget {
  const OrderDetailsMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order #1234"),
        leading: CustomBackButton(
          onTap: () {
            Get.back();
          },
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                "Delivery",
                style: TextStyle(
                    color: redColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      body:
          ListView(padding: EdgeInsets.symmetric(horizontal: 20.h), children: [
        const CustomVerticalSpacer(height: 20),
        Text(
          "Addresses",
          style: TextStyle(
              color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        const CustomVerticalSpacer(height: 10),
        const ODSenderAddressWidget(),
        const CustomVerticalSpacer(height: 10),
        const ODRecipientAddressWidget(),
        const CustomVerticalSpacer(height: 20),
        Text(
          "Delivery Man",
          style: TextStyle(
              color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        const CustomVerticalSpacer(height: 10),
        const ODDeliveryPersonWidget(),
        const CustomVerticalSpacer(height: 20),
        Text(
          "Item Information",
          style: TextStyle(
              color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        const CustomVerticalSpacer(height: 10),
        const ODTypeWidget(),
        const CustomVerticalSpacer(height: 20),
        Text(
          "Other Information",
          style: TextStyle(
              color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        const CustomVerticalSpacer(height: 10),
        const ODCollectPaymentWidget(),
        const CustomVerticalSpacer(height: 20),
        Text(
          "Photos",
          style: TextStyle(
              color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        const CustomVerticalSpacer(height: 15),
        const ODImageWidget(),
        const CustomVerticalSpacer(height: 40),
      ]),
      bottomNavigationBar: SizedBox(
        height: 45.h,
        child: const Row(children: [ODTotalWidget(), ODCancelWidget()]),
      ),
    );
  }
}
