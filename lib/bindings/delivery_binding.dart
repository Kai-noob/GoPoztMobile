import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:mengo_delivery/pages/delivery/sender/widgets/sender_confirm_widget.dart';

class DeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeliveryController(),permanent: true);
    Get.put(SenderController(),permanent: true);
    Get.put(ReceiverController(),permanent: true);
    // Get.lazyPut<SenderController>(
    //   () => SenderController(),
    // );
    // Get.lazyPut<ReceiverController>(
    //   () => ReceiverController(),
    // );
  }
}
