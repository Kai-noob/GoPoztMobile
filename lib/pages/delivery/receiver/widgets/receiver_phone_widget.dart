import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:nb_utils/nb_utils.dart';



class ReceiverPhoneWidget extends StatelessWidget {
final ReceiverController controller;
  const ReceiverPhoneWidget({
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
          initialValue: controller.receiverNumber,
          validator: ValidatorHelper().phoneValidator,
          onChanged: (value)=>controller.setReceiverNumber(value),
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: black, fontWeight: FontWeight.normal, fontSize: 14.sp),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            hintStyle: TextStyle(
                color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
            hintText: "Phone",
          ),
        ),
      ),
    );
  }
}