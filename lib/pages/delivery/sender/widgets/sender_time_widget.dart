import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../../../controllers/delivery_controller.dart';
import '../../../../utils/app_colors.dart';

class SenderTimeWidget extends StatelessWidget {
  final DeliveryController controller;
  SenderTimeWidget({
    super.key,
    required this.controller
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GestureDetector(
            onTap: () => _openDateTimePickerWithCustomButton(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.pickUpTime.isEmpty
                        ? "Pick up time"
                        : controller.pickUpTime,
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
            ),
          )),
    );
  }

  void _openDateTimePickerWithCustomButton(BuildContext context) {
    BottomPicker.dateTime(
      title: 'Set Pick up time',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        controller.setPickUpTime(date.toString());
      },
      onClose: () {
        print('Picker closed');
      },
      buttonText: 'Confirm',
      buttonTextStyle: const TextStyle(color: Colors.black),
      buttonSingleColor: primaryColor,
      iconColor: Colors.black,
      minDateTime: DateTime.now(),
      maxDateTime: DateTime.now().add(const Duration(days: 50)),
      gradientColors: const [Color(0xfffdcbf1), Color(0xffe6dee9)],
    ).show(context);
  }
}
