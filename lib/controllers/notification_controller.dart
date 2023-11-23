import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mengo_delivery/models/notification_model.dart';
import 'package:mengo_delivery/models/user_model.dart';

import 'package:mengo_delivery/routes/app_pages.dart';
import 'package:mengo_delivery/network/api_call_status.dart';

import '../helpers/shared_pref_helper.dart';
import '../helpers/snackbar_helper.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class NotificationController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;

  final BaseClient _baseClient = BaseClient();
  final RxList<NotificationModel> _notifications = RxList.empty();
  List<NotificationModel> get notifications => _notifications.toList();

  Future<void> getNotifications() async {
    await _baseClient.safeApiCall(
      ApiUrls.notificationsUrl, // url
      RequestType.get,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },

      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        apiCallStatus = ApiCallStatus.success;
        Logger().d("Notifications ${response.data}");
        _notifications.value =
            (response.data['notifications'] as List<dynamic>).map((item) {
          return NotificationModel.fromJson(item);
        }).toList();
        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(apiException: error);
        update();
      },
    );
  }

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }
}
