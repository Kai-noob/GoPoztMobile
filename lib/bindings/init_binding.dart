import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/home_controller.dart';
import 'package:mengo_delivery/controllers/menu_controller.dart';
import 'package:mengo_delivery/controllers/profile_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);


  }
}
