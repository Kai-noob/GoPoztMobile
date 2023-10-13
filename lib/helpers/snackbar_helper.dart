import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarHelper {
  static void showErrorMessage({
    required BuildContext context,
    required String title,
    Position position = Position.bottom,
    Widget? iconWidget,
  }) {
    CherryToast.error(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14.sp),
      ),
      toastPosition: position,
      animationCurve: Curves.fastOutSlowIn,
      iconWidget: iconWidget,
    ).show(context);
  }

  static void showSuccessMessage({
    required BuildContext context,
    required String title,
    Position position = Position.bottom,
    Widget? iconWidget,
  }) {
    CherryToast.success(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14.sp),
      ),
      toastPosition: position,
      animationCurve: Curves.fastOutSlowIn,
      iconWidget: iconWidget,
    ).show(context);
  }
}
