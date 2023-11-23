import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/models/way_history_model.dart';

class DeliveryFeeDetailsWidget extends StatelessWidget {
  final List<WayHistoryModel> histories;
  const DeliveryFeeDetailsWidget({super.key, required this.histories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        leading: CustomBackButton(onTap: () {
          Get.back();
        }),
      ),
      body: ListView.builder(
        itemCount: histories.length,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              title: Text("Way ${histories.indexOf(histories[index]) + 1}"),
              trailing:
                  Text("${calculateTotalFeeAmountPerWayHistory()[index]} MMK"),
            ),
          );
        },
      ),
    );
  }

  List<double> calculateTotalFeeAmountPerWayHistory() {
    // Assuming wayHistories is a List<WayHistory> in your ReceiverController
    List<double> totalFees = histories.map((wayHistory) {
      return wayHistory.wayFeeModel.overWeightFee +
          wayHistory.wayFeeModel.urgentFee +
          wayHistory.wayFeeModel.wayFee;
    }).toList();

    return totalFees;
  }
}
