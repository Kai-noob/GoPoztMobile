import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:nb_utils/nb_utils.dart';

class ReceiverNoteWidget extends StatelessWidget {
  final ReceiverController controller;
  const ReceiverNoteWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        initialValue: controller.receiverNote,
        validator: ValidatorHelper().noteValidator,
        onChanged: (value) => controller.setReceiverNote(value),
        maxLines: 2,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
            color: black, fontWeight: FontWeight.normal, fontSize: 13.sp),
        decoration: InputDecoration(
            hintText: "Note",
            hintStyle: TextStyle(
                color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
