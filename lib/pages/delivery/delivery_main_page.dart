import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';


import 'order/create_order/create_order_page.dart';

import 'order/order_history/order_history_page.dart';
import 'widgets/delivery_bottom_nav_bar_widget.dart';
import 'widgets/delivery_tabbar_widget.dart';

class DeliveryMainPage extends StatelessWidget {
  DeliveryMainPage({super.key});
  final DeliveryController controller = Get.find<DeliveryController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        body: const TabBarView(
          children: [CreateOrderPage(), OrderHistoryPage()],
        ),
        bottomNavigationBar: DeliveryBottomNavBarWidget(
          controller: controller,
          senders:controller.senders,
          receivers: controller.receivers,
        ),
      ),
    );
  }
}
