import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:mengo_delivery/helpers/snackbar_helper.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(BuildContext context,Response response) {
    if(response.statusCode == 401) {
      // Get.find<AuthController>().clearSharedData();
      // Get.find<WishListController>().removeWishes();
      // Get.offAllNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
    }else {
      SnackBarHelper().show(context,response.statusText!,SnackBarType.alert);
    }
  }
}
