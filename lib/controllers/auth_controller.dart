import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

import 'package:mengo_delivery/helpers/shared_pref_helper.dart';
import 'package:mengo_delivery/models/register_model.dart';
import 'package:mengo_delivery/routes/app_pages.dart';


import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';
import '../models/login_model.dart';
import '../utils/api_url.dart';

class AuthController extends GetxController {

  List<dynamic>? data;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // getting data from api
  register(RegisterModel registerModel, BuildContext context) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      ApiUrls.registerUrl, // url
      RequestType.post,
      // request type (get,post,delete,put)
      queryParameters: {
        "name": registerModel.name,
        "phone": registerModel.phone,
        "password": registerModel.password
      },
      onLoading: () {
        // *) indicate loading state
        context.loaderOverlay.show(
            widget: Material(
                child:
                    Center(child: Lottie.asset("assets/images/loading.json"))));
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully

        MySharedPref.setToken(response.data["token"]);
        Get.offAllNamed(Routes.dashboard);
        IconSnackBar.show(
            context: context,
            snackBarType: SnackBarType.alert,
            label: 'Successfully registerd.');
        context.loaderOverlay.hide();
        // Get.offNamed(Routes.LOGIN);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;

        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        context.loaderOverlay.hide();
        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  login(LoginModel loginModel, BuildContext context) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      ApiUrls.loginUrl, // url
      RequestType.post,
      // headers: {
      //   "Content-Type": "application/json",
      //   "Accept": "application/json"
      // },
      // request type (get,post,delete,put)
      queryParameters: {
        "phone": loginModel.phone,
        "password": loginModel.password
      },
      onLoading: () {
        context.loaderOverlay.show(
            widget: Material(
                child:
                    Center(child: Lottie.asset("assets/images/loading.json"))));
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully

        Logger().d(response.data["token"]);
        MySharedPref.setToken(response.data["token"]);
        Get.offAllNamed(Routes.dashboard);
        IconSnackBar.show(
            context: context,
            snackBarType: SnackBarType.alert,
            label: response.data["message"]);
        context.loaderOverlay.hide();

        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);

        context.loaderOverlay.hide();
        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }
}