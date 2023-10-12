import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';


class ReceiverConfirmWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ReceiverConfirmWidget({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: primaryColor),
            child: Text(
              "Confirm",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}