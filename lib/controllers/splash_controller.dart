import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:mengo_delivery/helpers/shared_pref_helper.dart';

import 'package:mengo_delivery/routes/app_pages.dart';

import 'dart:async';

import 'package:mengo_delivery/network/api_call_status.dart';
import 'package:mengo_delivery/utils/api_url.dart';

import '../network/base_client.dart';

class SplashController extends GetxController {
  Timer? _timer;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  bool invalidToken = false;
  final BaseClient _baseClient = BaseClient();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
        print(response);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        print(error);
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

  refreshToken(
    String deviceToken,
  ) async {
    await _baseClient.safeApiCall(
      ApiUrls
          .deviecTokenUrl, // Replace with the actual update profile API endpoint
      RequestType.put, // Use the appropriate HTTP method for updating profiles
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      queryParameters: {"device_token": deviceToken},
      onLoading: () {
        // Indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // API call done successfully
        // _userModel.value = UserModel.fromJson(response.data);
        // Logger().e(_userModel.value);

        Logger().d("Token ${response.data}");

        // Indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();

        // Show success message to the user
        // SnackBarHelper.showSuccessMessage(
        //   context: context,
        //   title: response.data["message"],
        // );
      },
      onError: (error) {
        // Show error message to the user
        BaseClient.handleApiError(apiException: error);

        // Indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  void requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}
  }

  //step 2

  getToken() async {
    await _firebaseMessaging.getToken().then((value) async {
      print(value);
      await refreshToken(value!);
    });
  }

//step 3
  // saveToken(String token) async {
  //   await BaseClient.post(
  //     Constants.saveToken,
  //     // headers: {"content-type": "multipart/form-data"},
  //     headers: await CustomHeader().getCustomHeaders(),

  //     data: FormData.fromMap({'device_token': token}),

  //     onSuccess: (response) {
  //       // EasyLoading.dismiss();
  //       TokenResponse tokenResponse = TokenResponse.fromJson(response.data);
  //       // Fluttertoast.showToast(msg: tokenResponse.message);
  //     },
  //     onError: (error) {
  //       //  if (error.statusCode != 200) {

  //       // print(error.response);
  //       // EasyLoading.showError(error.message);

  //       // }
  //       // EasyLoading.dismiss();
  //       // BaseClient.handleApiError(error);

  //       update();
  //     },
  //   );
  // }

//step 4
  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((messaging) {
      showNotification(messaging);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((messaging) {
      showNotification(messaging);
    });
  }

  void initLocalInitialization() async {
    var androidIntialization =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initialSettings = InitializationSettings(android: androidIntialization);

    await _flutterLocalNotificationsPlugin.initialize(initialSettings,
        onDidReceiveNotificationResponse: (payload) {});
  }

  //step 6
  Future<void> showNotification(RemoteMessage message) async {
    // channel for id and name
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
        "channel_id", "High Importance",
        importance: Importance.max);
    // notification details
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("Channel_id", channel.name.toString(),
            importance: Importance.high,
            icon: "@mipmap/ic_launcher",
            priority: Priority.high,
            ticker: 'ticker');
    // put the andoid notification to notification details
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    // to show the notification on the screen
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  void getRfreshToken() async {
    _firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  @override
  void onInit() {
    checkAuthenticationStatus();

    getProfile();

    requestPermission();
    getToken();
    firebaseInit();
    initLocalInitialization();

    super.onInit();
  }

  @override
  void onClose() {
    _timer
        ?.cancel(); // Make sure to cancel the timer when the controller is closed
    super.onClose();
  }
}
