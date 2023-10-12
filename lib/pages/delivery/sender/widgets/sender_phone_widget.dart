import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:nb_utils/nb_utils.dart';




class SenderPhoneWidget extends StatelessWidget {
  final DeliveryController controller;
  const SenderPhoneWidget({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          keyboardType: TextInputType.name,
          initialValue: controller.senderNumber,
          onChanged: (value)=>controller.setSenderNumber(value),
          validator: ValidatorHelper().phoneValidator,
          style: primaryTextStyle(
              color: black, weight: FontWeight.normal, size: 12),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            hintStyle: TextStyle(
                color: black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500),
            hintText: "Phone",
          ),
        ),
      ),
    );
  }

  
}