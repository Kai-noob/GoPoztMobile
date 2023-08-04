import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/pages/home/home_page.dart';

class RouteHelper {
  static const initial = '/';

  static String getInitialRoute() => initial;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => getRoute(const HomePage())),
  ];

  static Widget getRoute(
    Widget navigateTo,
  ) {
    double? minimumVersion = 0;
    // if(GetPlatform.isAndroid) {
    //   minimumVersion = Get.find<SplashController>().configModel!.appMinimumVersionAndroid;
    // }else if(GetPlatform.isIOS) {
    //   minimumVersion = Get.find<SplashController>().configModel!.appMinimumVersionIos;
    // }
    // return AppConstants.appVersion < minimumVersion! ? const UpdateScreen(isUpdate: true)
    //     : Get.find<SplashController>().configModel!.maintenanceMode! ? const UpdateScreen(isUpdate: false)
    //     : Get.find<LocationController>().getUserAddress() == null
    //     ? AccessLocationScreen(fromSignUp: false, fromHome: false, route: Get.currentRoute) : navigateTo;
    return navigateTo;
  }
}
