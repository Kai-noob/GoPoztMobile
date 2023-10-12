import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrderHistoryDeliveryIdWidget extends StatelessWidget {
  const OrderHistoryDeliveryIdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery id:2324",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "Mg Mg",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
