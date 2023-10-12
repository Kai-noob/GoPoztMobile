import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class ODCancelWidget extends StatelessWidget {
  const ODCancelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      height: double.infinity,
      decoration: const BoxDecoration(color: redColor),
      child: Text(
        "Cancel",
        style: TextStyle(
            color: white, fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
    ));
  }
}
