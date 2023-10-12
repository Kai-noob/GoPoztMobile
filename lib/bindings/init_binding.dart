import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/menu_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true);
  }
}
