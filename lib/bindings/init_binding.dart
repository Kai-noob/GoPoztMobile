import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/menu_controller.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => CustomMenuController(),fenix: true);
  }


}