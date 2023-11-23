import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../controllers/splash_controller.dart';
import '../../network/api_call_status.dart';
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
            appIcon: ClipRRect(
               borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/icons/logo.png')),
            child: Scaffold(
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/icons/logo.png",
                            height: 120.h,
                          ),
                        ),
                        const CustomVerticalSpacer(height: 10),
                        const Text(
                          "Delivery Hub",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                  ],
                ),
              ),
            )));
  }
}
