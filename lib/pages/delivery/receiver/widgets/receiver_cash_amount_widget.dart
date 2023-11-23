import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';

class ReceiverCashAmountWidget extends StatelessWidget {
  final ReceiverController controller;
  const ReceiverCashAmountWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          initialValue: controller.receiverCashAmount,
          onChanged: (value) => controller.setReceiverCashAmount(value),
          validator: ValidatorHelper().cashValidator,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: black, fontWeight: FontWeight.normal, fontSize: 14.sp),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: "Collect cash amount",
            hintStyle: TextStyle(
                color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}