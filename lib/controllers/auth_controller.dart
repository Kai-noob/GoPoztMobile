import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:logger/logger.dart';

import 'package:mengo_delivery/helpers/shared_pref_helper.dart';
import 'package:mengo_delivery/helpers/snackbar_helper.dart';
import 'package:mengo_delivery/models/register_model.dart';
import 'package:mengo_delivery/routes/app_pages.dart';

import '../network/api_call_status.dart';
import '../network/base_client.dart';
import '../models/login_model.dart';
import '../utils/api_url.dart';

class AuthController extends GetxController {
  List<dynamic>? data;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  final BaseClient _baseClient = BaseClient();

  // getting data from api
  register(RegisterModel registerModel, BuildContext context) async {
    // *) perform api call
    await _baseClient.safeApiCall(
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

        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully

        MySharedPref.setToken(response.data["token"]);
        MySharedPref.setUserId(response.data['user']['id']);
        Get.offAllNamed(Routes.dashboard);
        SnackBarHelper.showSuccessMessage(
            context: context, title: "Successfully registerd.");

        // Get.offNamed(Routes.LOGIN);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;

        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(apiException: error,context: context);

        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  login(LoginModel loginModel, BuildContext context) async {
    // *) perform api call
    await _baseClient.safeApiCall(
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
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully

        Logger().d(response.data["token"]);
        MySharedPref.setToken(response.data["token"]);
             MySharedPref.setUserId(response.data['user']['id']);
        Get.offAllNamed(Routes.dashboard);
        SnackBarHelper.showSuccessMessage(
            context: context, title: "Successfully logined.");

        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(apiException: error,context: context);

        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }
}
