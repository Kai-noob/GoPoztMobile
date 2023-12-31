import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:mengo_delivery/pages/delivery/receiver/widgets/receiver_confirm_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class ReceiverAddressWidget extends StatelessWidget {
  final ReceiverController controller;
  const ReceiverAddressWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          keyboardType: TextInputType.name,
          initialValue: controller.receiverAddress,
          validator: ValidatorHelper().addressValidator,
          onChanged: (value) => controller.setReceiverAddress(value),
          style: TextStyle(
              color: black, fontWeight: FontWeight.normal, fontSize: 14.sp),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: "Detailed address(eg.*street)",
            hintStyle: TextStyle(
                color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
