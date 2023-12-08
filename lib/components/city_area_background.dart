import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityAreaBackground extends StatelessWidget {
  final Widget child;

  const CityAreaBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300.0,
      height: 400.0.h,
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: const Color(0xFFF5F5F5),
      ),
      child: child,
    );
  }
}
