import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';

class SenderConfirmWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SenderConfirmWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: primaryColor),
          alignment: Alignment.center,
          child: Text(
            "Confirm",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
