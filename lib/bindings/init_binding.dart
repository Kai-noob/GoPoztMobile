import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/home_controller.dart';
import 'package:mengo_delivery/controllers/menu_controller.dart';
import 'package:mengo_delivery/controllers/notification_controller.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';
import 'package:mengo_delivery/controllers/profile_controller.dart';
import 'package:mengo_delivery/controllers/splash_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomMenuController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => OrdersController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
