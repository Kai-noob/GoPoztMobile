import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/models/sender_model.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../network/api_call_status.dart';
import '../../utils/app_colors.dart';
import 'order/create_order/create_order_page.dart';

import 'order/order_history/order_history_page.dart';
import 'widgets/delivery_bottom_nav_bar_widget.dart';
import 'widgets/delivery_tabbar_widget.dart';

class DeliveryMainPage extends StatelessWidget {
  const DeliveryMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryController>(builder: (controller) {
      return OverlayLoaderWithAppIcon(
        isLoading: controller.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: Image.asset('assets/icons/icon.png'),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            // appBar: AppBarWidget(
            //   title: "Mengo Delivery",
            //   isBackIconShow: true,
            //   onBackIconPressed: () {
            //     Get.back();
            //   },
            // ),
            appBar: AppBar(
              leading: const CustomBackButton(),
              title: const DeliveryTabBarWidget(),
            ),
            body: TabBarView(
              children: [
                CreateOrderPage(
                  controller: controller,
                ),
                OrderHistoryPage(
                  controller: controller,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
