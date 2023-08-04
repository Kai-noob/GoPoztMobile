import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeOrderItemWidget extends StatelessWidget {
  final DateTime dateTime;
  final String status;
  final String delivererName;
  final String pickupAddress;
  final String deliveryAddress;
  final String totalPrice;
  final VoidCallback onSeeMorePressed;

  const HomeOrderItemWidget({
    super.key,
    required this.dateTime,
    required this.status,
    required this.delivererName,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.totalPrice,
    required this.onSeeMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDateTime = DateFormat('dd/MM/yy  h:mm a').format(dateTime);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: primaryColor)),
      // elevation: 4,

      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order#1232323',
              style: TextStyle(
                fontSize: 18.0.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDateTime,
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Completed",
                      style: primaryTextStyle(color: greenColor, size: 14),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    AppConstants.statusIcon,
                  ],
                ),
              ],
            ),
            const Divider(),
            Text(
              'ပို့ဆောင်သူ: $delivererName',
              style: TextStyle(fontSize: 14.0.sp, color: Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              'ယူဆောင်ရမည့်နေရာ $pickupAddress',
              style: TextStyle(fontSize: 14.0.sp, color: Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              'ပို့ဆောင်ရမည့်နေရာ: $deliveryAddress',
              style: TextStyle(fontSize: 14.0.sp, color: Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              'ကျသင့်ငွေ: $totalPrice',
              style: TextStyle(fontSize: 14.0.sp, color: Colors.black),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onSeeMorePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'See More',
                style: TextStyle(fontSize: 14.0.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
