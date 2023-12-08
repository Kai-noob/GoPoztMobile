import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:mengo_delivery/pages/delivery/receiver/widgets/receiver_confirm_widget.dart';

import '../../widgets/delivery_bottom_nav_bar_widget.dart';
import 'widgets/create_order_time_widget.dart';
import 'widgets/create_order_card.dart';

class CreateOrderPage extends StatelessWidget {
  final SenderController senderController;
  final ReceiverController receiverController;
  final DeliveryController deliveryController;
  final int? partnerId;
  final bool? isPartner;
  const CreateOrderPage(
      {super.key,
      required this.senderController,
      required this.receiverController,
      required this.deliveryController,
      required this.partnerId,
      required this.isPartner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
          // AppConstants.defaultSpacer,

          CreateOrderCard(
            senderController: senderController,
            receiverController: receiverController,
          ),
          const CustomVerticalSpacer(height: 10),
          const CreateOrderTimeWidget(),
          const CustomVerticalSpacer(height: 20),
        ]),
        bottomNavigationBar: Obx(
          () => DeliveryBottomNavBarWidget(
            controller: deliveryController,
            sender: senderController.sender,
            parcels: receiverController.parcels,
            receiverController: receiverController,
            partnerId: partnerId,
            isPartner: isPartner,
          ),
        ));
  }
}
