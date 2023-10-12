import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  // final controller = Get.put(SplashScreenController());
  final SplashController mainController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/logo.png",
              height: 120.h,
            ),
          ],
        ),
      ),
    );
  }
}
