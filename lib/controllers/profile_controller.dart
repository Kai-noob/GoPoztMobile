import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mengo_delivery/models/user_model.dart';

import 'package:mengo_delivery/routes/app_pages.dart';
import 'package:mengo_delivery/network/api_call_status.dart';

import '../helpers/shared_pref_helper.dart';
import '../helpers/snackbar_helper.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class ProfileController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;

  final Rx<UserModel> _userModel=UserModel(id: 0, name: "", phone: "", level: "").obs;
  UserModel get userModel=> _userModel.value;
  final BaseClient _baseClient = BaseClient();

  logout(BuildContext context) async {
    // *) perform api call
    await _baseClient.safeApiCall(
      ApiUrls.logoutUrl, // url
      RequestType.post,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      onLoading: () {
        // *) indicate loading state

        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        MySharedPref.clear();

        Get.offNamed(Routes.splash);

        SnackBarHelper.showSuccessMessage(
            context: context, title: response.data["message"]);

        // Get.offNamed(Routes.LOGIN);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;

        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(apiException: error);

        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  getProfile() async {
    await _baseClient.safeApiCall(
      ApiUrls.profileUrl,
      RequestType.get,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      // request type (get,post,delete,put)

      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        _userModel.value=UserModel.fromJson(response.data);
        Logger().e(_userModel.value);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user

        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
