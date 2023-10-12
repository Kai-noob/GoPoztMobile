import 'package:flutter/material.dart';

import 'package:mengo_delivery/components/custom_vertical_spacer.dart';


import 'widgets/create_order_time_widget.dart';
import 'widgets/create_order_card.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      // AppConstants.defaultSpacer,
      CustomVerticalSpacer(height: 10),
      CreateOrderCard(),
      CustomVerticalSpacer(height: 10),
      CreateOrderTimeWidget(),
      CustomVerticalSpacer(height: 20),
    ]);
  }
}
