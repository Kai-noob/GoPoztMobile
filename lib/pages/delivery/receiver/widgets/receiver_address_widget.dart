import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:nb_utils/nb_utils.dart';



class ReceiverAddressWidget extends StatelessWidget {
  final DeliveryController controller;
  const ReceiverAddressWidget({
    super.key,
    required this.controller
  });

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
          onChanged: (value)=>controller.setReceiverAddress(value),
          style: primaryTextStyle(
              color: black, weight: FontWeight.normal, size: 12),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: "Detailed address(eg.*street)",
            hintStyle: TextStyle(
                color: black, fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
