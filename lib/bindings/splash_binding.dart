import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/splash_controller.dart';
import '../controllers/auth_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
