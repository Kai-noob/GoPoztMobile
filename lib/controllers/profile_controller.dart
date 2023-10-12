

import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:mengo_delivery/routes/app_pages.dart';
import 'package:mengo_delivery/services/api_call_status.dart';

import '../helpers/shared_pref_helper.dart';
import '../services/base_client.dart';
import '../utils/api_url.dart';

class ProfileController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;

  logout(BuildContext context) async {
    // *) perform api call
    await BaseClient.safeApiCall(
      ApiUrls.logoutUrl, // url
      RequestType.post,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
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
        MySharedPref.clear();

        Get.offNamed(Routes.splash);

        IconSnackBar.show(
            context: context,
            snackBarType: SnackBarType.alert,
            label: response.data!["message"]);
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
}
