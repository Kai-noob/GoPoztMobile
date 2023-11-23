import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:iconoir_flutter/media_image.dart';

import 'package:mengo_delivery/controllers/home_controller.dart';

import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../models/announcement_model.dart';

import '../../network/api_call_status.dart';
import 'widgets/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return OverlayLoaderWithAppIcon(
        isLoading: homeController.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: ClipRRect(
           borderRadius: BorderRadius.circular(100),
          child: Image.asset('assets/icons/logo.png')),
        child: Scaffold(
          body: SafeArea(
            child: HomeView(controller: homeController),
          ),
        ),
      );
    });
  }
}
