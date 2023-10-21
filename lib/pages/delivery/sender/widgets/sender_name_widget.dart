import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';

import 'package:nb_utils/nb_utils.dart';

class SenderNameWidget extends StatelessWidget {
  final DeliveryController controller;

  const SenderNameWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          initialValue: controller.senderName,
          onChanged: (value) => controller.setSenderName(value),
          validator: ValidatorHelper().nameValidator,
          keyboardType: TextInputType.name,
          style: TextStyle(
              color: black, fontWeight: FontWeight.normal, fontSize: 14.sp),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
            hintText: "Name",
          ),
        ),
      ),
    );
  }
}
