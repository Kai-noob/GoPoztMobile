import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/splash_controller.dart';
import 'package:mengo_delivery/helpers/shared_pref_helper.dart';

import 'package:shared_preferences/shared_preferences.dart';



import '../models/language_model.dart';

import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  await MySharedPref.init(sharedPreferences);

  // Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  // Get.lazyPut(() => SplashController(splashRepo: Get.find()));

  Get.lazyPut(
    () => SplashController(),
  );

 
}
