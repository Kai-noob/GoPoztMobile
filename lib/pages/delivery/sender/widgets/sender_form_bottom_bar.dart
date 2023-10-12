import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controllers/delivery_controller.dart';
import '../../../../models/sender_model.dart';
import 'sender_clear_all_widget.dart';
import 'sender_confirm_widget.dart';


class SenderFormBottomBar extends StatelessWidget {
  final DeliveryController controller;
  final GlobalKey<FormState> formKey;

  const SenderFormBottomBar({
    super.key,
    required this.controller,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 45.h,
      child: Row(
        children: [
          SenderClearAllWidget(
            onTap: () {
              controller.setSenderName("");
              controller.setSenderNumber("");
              controller.setSenderAddress("");
              controller.setSenderNote("");
              controller.selectSenderCity(0, "");
              controller.selectSenderTownship(0, "");
              controller.setPickUpTime("");
            },
          ),
          SenderConfirmWidget(
            onTap: () {
              if (!formKey.currentState!.validate()) {
                return;
              }
              if (controller.senderCityName.isEmpty ||
                  controller.senderTownshipName.isEmpty) {
                IconSnackBar.show(
                  context: context,
                  label: "Please Select City And Township",
                  snackBarType: SnackBarType.alert,
                );
                return;
              }

              if (controller.pickUpTime.isEmpty) {
                IconSnackBar.show(
                  context: context,
                  label: "Please Select Pick Up Time",
                  snackBarType: SnackBarType.alert,
                );
                return;
              }

              controller.saveSenderForm(
                SenderModel(
                  name: controller.senderName,
                  phone: controller.senderNumber,
                  cityId: controller.senderCityId,
                  townshipId: controller.senderTownshipId,
                  street: controller.senderAddress,
                  description: controller.senderNote,
                ),
                controller.pickUpTime,
              );
            },
          ),
        ],
      ),
    );
  }
}
