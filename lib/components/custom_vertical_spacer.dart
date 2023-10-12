import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVerticalSpacer extends StatelessWidget {
  final double height;
  const CustomVerticalSpacer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}
