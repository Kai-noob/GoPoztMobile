import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';

class ReceiverFeeDetailsWidget extends StatelessWidget {
  final bool isUrgent;
  final bool isOverweight;
  final double wayFee;
  final double urgentFee;
  final double overWeightFee;
  const ReceiverFeeDetailsWidget(
      {super.key,
      required this.isUrgent,
      required this.isOverweight,
      required this.wayFee,
      required this.urgentFee,
      required this.overWeightFee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        leading: CustomBackButton(onTap: () {
          Get.back();
        }),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              title: const Text("Way Fee"),
              trailing: Text("${wayFee.toString()} MMK"),
            ),
            const CustomVerticalSpacer(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              title: const Text("Overweight Fee"),
              trailing:
                  Text("${isOverweight ? overWeightFee.toString() : 0} MMK"),
            ),
            const CustomVerticalSpacer(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              title: const Text("Urgent Fee"),
              trailing: Text("${isUrgent ? urgentFee.toString() : 0} MMK"),
            ),
          ]),
    );
  }
}
