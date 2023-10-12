import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';

class ReceiverCashAmountWidget extends StatelessWidget {
  final DeliveryController controller;
  const ReceiverCashAmountWidget({
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
          initialValue: controller.receiverCashAmount,
          onChanged: (value)=>controller.setReceiverCashAmount(value),
          validator: ValidatorHelper().cashValidator,
          keyboardType: TextInputType.name,
          style: primaryTextStyle(
              color: black, weight: FontWeight.normal, size: 12),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: "Collect cash amount",
            hintStyle: TextStyle(
                color: black, fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  void _openCollectButton(BuildContext context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    15.verticalSpace,
                    Text(
                      "Collect Payment",
                      style: TextStyle(
                          color: black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    30.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: white),
                            onPressed: () {},
                            child: const Text(
                              "Collect from sender",
                              style: TextStyle(color: primaryColor),
                            )),
                        8.horizontalSpace,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: white),
                            onPressed: () {},
                            child: const Text(
                              "Collect from recipient",
                              style: TextStyle(color: primaryColor),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
