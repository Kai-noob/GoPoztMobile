import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:nb_utils/nb_utils.dart';

class SenderNoteWidget extends StatelessWidget {
  final DeliveryController controller;
  const SenderNoteWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          keyboardType: TextInputType.name,
          style: TextStyle(
              color: black, fontWeight: FontWeight.normal, fontSize: 14.sp),
          initialValue: controller.senderNote,
          onChanged: (value) => controller.setSenderNote(value),
          validator: ValidatorHelper().noteValidator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
            hintText: "Note",
          ),
        ),
      ),
    );
  }
}
