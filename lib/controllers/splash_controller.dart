import 'package:get/get.dart';

import 'package:mengo_delivery/helpers/shared_pref_helper.dart';

import 'package:mengo_delivery/routes/app_pages.dart';

import 'dart:async';

import 'package:mengo_delivery/services/api_call_status.dart';
import 'package:mengo_delivery/utils/api_url.dart';

import '../../../services/base_client.dart';

class SplashController extends GetxController {
  Timer? _timer;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  bool invalidToken = false;

  void checkAuthenticationStatus() async {
    await getProfile();
    if (MySharedPref.getToken() != null && !invalidToken) {
      // User is authenticated, navigate to home page
      _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        Get.offNamed(Routes.dashboard);
        _timer?.cancel(); // Cancel the timer
        Get.delete<SplashController>();
      });
    } else {
      // User is not authenticated, navigate to registration page
      _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        Get.offNamed(Routes.register);
        _timer?.cancel(); // Cancel the timer
        Get.delete<SplashController>();
      });
    }
  }

  getProfile() async {
    //profile
    await BaseClient.safeApiCall(
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

        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user

        if (error.response!.statusCode == 401) {
          invalidToken = true;
          MySharedPref.clear();
          update();
        }
        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  @override
  void onInit() {
    checkAuthenticationStatus();

    getProfile();

    super.onInit();
  }

  @override
  void onClose() {
    _timer
        ?.cancel(); // Make sure to cancel the timer when the controller is closed
    super.onClose();
  }
}
