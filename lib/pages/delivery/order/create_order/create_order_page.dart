import 'package:flutter/material.dart';

import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';

import '../../widgets/delivery_bottom_nav_bar_widget.dart';
import 'widgets/create_order_time_widget.dart';
import 'widgets/create_order_card.dart';

class CreateOrderPage extends StatelessWidget {
  final DeliveryController controller;
  const CreateOrderPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        // AppConstants.defaultSpacer,
        const CustomVerticalSpacer(height: 10),
        CreateOrderCard(
          controller: controller,
        ),
        const CustomVerticalSpacer(height: 10),
        const CreateOrderTimeWidget(),
        const CustomVerticalSpacer(height: 20),
      ]),
      bottomNavigationBar: DeliveryBottomNavBarWidget(
        controller: controller,
        sender: controller.sender,
        parcels: controller.parcels,
      ),
    );
  }
}
