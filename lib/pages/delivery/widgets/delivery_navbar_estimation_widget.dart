import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/pages/delivery/widgets/delivery_fee_details_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class DeliveryNavBarEstimationWidget extends StatelessWidget {
  final ReceiverController receiverController;
  const DeliveryNavBarEstimationWidget({
    super.key,
    required this.receiverController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Estimation",
                    style: TextStyle(
                        color: black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  4.verticalSpace,
                  Text(
                    "MMK-${calculateTotalFeeAmount().toString()}",
                    style: TextStyle(
                        color: black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => DeliveryFeeDetailsWidget(
                    histories: receiverController.wayHistories));
              },
              child: Column(
                children: [
                  const Icon(
                    LineIcons.caret_up,
                    color: Colors.black,
                    size: 20,
                  ),
                  Text(
                    "Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateTotalFeeAmount() {
    // Assuming wayHistories is a List<WayHistory> in your ReceiverController
    double totalFee =
        receiverController.wayHistories.fold(0, (sum, wayHistory) {
      return sum +
          wayHistory.wayFeeModel.overWeightFee +
          wayHistory.wayFeeModel.urgentFee +
          wayHistory.wayFeeModel.wayFee;
    });

    return totalFee;
  }
}
