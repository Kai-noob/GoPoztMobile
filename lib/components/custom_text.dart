import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;

  const CustomText({super.key,this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text??"",
      style: TextStyle(
          color: color??Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w500),
    );
  }
}