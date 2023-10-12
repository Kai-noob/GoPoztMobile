import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';


class SenderClearAllWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SenderClearAllWidget({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Text(
            "Clear all",
            style: TextStyle(
                color: black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}