import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class SenderClearAllWidget extends StatelessWidget {
  final String? label;
  final VoidCallback onTap;
  const SenderClearAllWidget({super.key, required this.onTap, this.label});

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
            label ?? "Clear all",
            style: TextStyle(
                color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
