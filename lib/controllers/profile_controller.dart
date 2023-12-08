import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

import 'package:logger/logger.dart';
import 'package:mengo_delivery/models/user_model.dart';

import 'package:mengo_delivery/routes/app_pages.dart';
import 'package:mengo_delivery/network/api_call_status.dart';
import 'package:path/path.dart';

import '../helpers/shared_pref_helper.dart';
import '../helpers/snackbar_helper.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class ProfileController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;

  final Rx<UserModel> _userModel = UserModel(
    id: 0,
    name: "",
    phone: "",
    level: "",
  ).obs;
  UserModel get userModel => _userModel.value;
  final BaseClient _baseClient = BaseClient();

  final RxString _newPassword = "".obs;
  String get newPassword => _newPassword.value;
  final RxString _confirmNewPassword = "".obs;
  String get confirmNewPassword => _confirmNewPassword.value;

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
        _userModel.value = UserModel.fromJson(response.data);
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

  updateProfile(
    BuildContext context,
    UserModel user,
  ) async {
    await _baseClient.safeApiCall(
      ApiUrls
          .editProfileUrl, // Replace with the actual update profile API endpoint
      RequestType.post, // Use the appropriate HTTP method for updating profiles
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },

      data: FormData.fromMap({
        // 'profile': await MultipartFile.fromFile(
        //   profile.path,
        //   filename: basename(profile.path),
        // ),
        '_method': 'put',
        "name": userModel.name,
        "phone": userModel.phone,
        // Add any other form fields as needed
      }),
      onLoading: () {
        // Indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // API call done successfully
        // _userModel.value = UserModel.fromJson(response.data);
        // Logger().e(_userModel.value);
        getProfile();
        // Indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();

        // Show success message to the user
        SnackBarHelper.showSuccessMessage(
          context: context,
          title: response.data["message"],
        );
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

  updateProfileImage(
    BuildContext context,
    File profile,
  ) async {
    await _baseClient.safeApiCall(
      ApiUrls
          .editProfileUrl, // Replace with the actual update profile API endpoint
      RequestType.post, // Use the appropriate HTTP method for updating profiles
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },

      data: FormData.fromMap({
        '_method': 'put',
        'profile': await MultipartFile.fromFile(profile.path,
            filename: profile.path.split('/').last),
        // Add any other form fields as needed
      }),
      onLoading: () {
        // Indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // API call done successfully
        // _userModel.value = UserModel.fromJson(response.data);
        // Logger().e(_userModel.value);

        // Indicate success state
        getProfile();
        apiCallStatus = ApiCallStatus.success;
        update();

        // Show success message to the user
        SnackBarHelper.showSuccessMessage(
          context: context,
          title: response.data["message"],
        );
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

  updatePassword(
    BuildContext context,
    String password,
  ) async {
    await _baseClient.safeApiCall(
      ApiUrls
          .editProfileUrl, // Replace with the actual update profile API endpoint
      RequestType.post, // Use the appropriate HTTP method for updating profiles
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },

      data: FormData.fromMap({
        '_method': 'put',
        'password': password
        // Add any other form fields as needed
      }),
      onLoading: () {
        // Indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // API call done successfully
        // _userModel.value = UserModel.fromJson(response.data);
        // Logger().e(_userModel.value);

        // Indicate success state
        getProfile();
        apiCallStatus = ApiCallStatus.success;
        update();

        // Show success message to the user
        SnackBarHelper.showSuccessMessage(
          context: context,
          title: "Password Changed Successfully",
        );
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

  setUserName(String name) {
    _userModel.value.name = name;
  }

  setPhone(String phone) {
    _userModel.value.phone = phone;
  }

  setNewPassword(String newPassword) {
    _newPassword.value = newPassword;
  }

  setConfirmPassword(String confirmPassword) {
    _confirmNewPassword.value = confirmPassword;
  }

  bool validatePasswords() {
    return _newPassword.value == _confirmNewPassword.value;
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
