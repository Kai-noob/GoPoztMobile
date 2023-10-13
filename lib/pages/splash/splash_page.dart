import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../controllers/splash_controller.dart';
import '../../services/api_call_status.dart';
import '../../utils/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => OverlayLoaderWithAppIcon(
            isLoading: controller.apiCallStatus == ApiCallStatus.loading,
            overlayBackgroundColor: Colors.black,
            circularProgressColor: primaryColor,
            appIcon: Image.asset('assets/icons/icon.png'),
            child: Scaffold(
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
            )));
  }
}
