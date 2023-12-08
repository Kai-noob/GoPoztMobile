import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:mengo_delivery/models/sender_model.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../network/api_call_status.dart';
import '../../utils/app_colors.dart';
import 'order/create_order/create_order_page.dart';

import 'order/order_history/order_history_page.dart';
import 'widgets/delivery_bottom_nav_bar_widget.dart';
import 'widgets/delivery_tabbar_widget.dart';

class DeliveryMainPage extends StatefulWidget {
  const DeliveryMainPage({super.key});

  @override
  State<DeliveryMainPage> createState() => _DeliveryMainPageState();
}

class _DeliveryMainPageState extends State<DeliveryMainPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ReceiverController receiverController =
        Get.find<ReceiverController>();
    final DeliveryController deliveryController =
        Get.find<DeliveryController>();
    final Map<String, dynamic>? arguments =
        Get.arguments as Map<String, dynamic>?;

    final int? partnerId = arguments?['partner_id'] as int?;
    final bool? isPartner = arguments?['isPartner'] as bool?;

    final SenderController senderController = Get.find<SenderController>();
    final OrdersController ordersController = Get.find<OrdersController>();
    TabController controller = TabController(vsync: this, length: 2);

    return DefaultTabController(
        length: 2,
        child: GetBuilder<DeliveryController>(
          builder: (deliveryController) {
            return OverlayLoaderWithAppIcon(
              isLoading:
                  deliveryController.apiCallStatus == ApiCallStatus.loading,
              overlayBackgroundColor: Colors.black,
              circularProgressColor: primaryColor,
              appIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/icons/logo.png')),
              child: Scaffold(
                  // appBar: AppBar(
                  //   title: const Text("Delivery Hub"),
                  // ),
                  body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    30.verticalSpace,
                    Card(
                      elevation: 5.0,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: TabBar(
                          controller: controller,
                          indicator: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          unselectedLabelColor: Colors.grey,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 25),
                          tabs: const [
                            Tab(
                              text: "Delivery",
                            ),
                            Tab(
                              text: "Order",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: TabBarView(
                      controller: controller,
                      children: [
                        CreateOrderPage(
                          senderController: senderController,
                          receiverController: receiverController,
                          deliveryController: deliveryController,
                          partnerId: partnerId,
                          isPartner: isPartner,
                        ),
                        OrderHistoryPage(
                          controller: ordersController,
                        )
                      ],
                    ))
                  ],
                ),
              )),
            );
          },
        ));
  }
}
