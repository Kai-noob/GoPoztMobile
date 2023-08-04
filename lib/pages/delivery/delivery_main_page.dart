import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/appbar_widget.dart';
import 'package:mengo_delivery/pages/delivery/widgets/delivery_limit_orders_text_widget.dart';
import 'package:mengo_delivery/pages/delivery/widgets/delivery_select_address_card.dart';
import 'package:mengo_delivery/pages/delivery/widgets/delivery_warning_widget.dart';
import 'package:mengo_delivery/utils/app_constants.dart';

import 'widgets/delivery_instruction_widget.dart';
import 'widgets/delivery_order_button.dart';

class DeliveryMainPage extends StatelessWidget {
  const DeliveryMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Mengo Delivery",
        isBackIconShow: true,
        onBackIconPressed: () {
          Get.back();
        },
      ),
      body: ListView(children: [
        // AppConstants.defaultSpacer,
        const DeliverySelectAddressCard(),
        const DeliveryWarningWidget(),
        AppConstants.defaultSpacer,
        const DeliveryInstructionWidget(),
        SizedBox(
          height: 5.h,
        ),
        const DeliveryLimitOrdersWidget(),
        AppConstants.defaultSpacer,
        const DeliveryOrderButton(),
        SizedBox(
          height: 20.h,
        ),
      ]),
    );
  }
}
