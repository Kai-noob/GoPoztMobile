import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mengo_delivery/components/custom_divider.dart';

import 'create_order_from_widget.dart';
import 'create_order_to_widget.dart';

class CreateOrderCard extends StatelessWidget {
  const CreateOrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CreateOrderFromWidget(),
            CustomDivider(
              color: Colors.grey.withOpacity(0.9),
              endIndent: 10,
              indent: 10,
            ),
            const CreateOrderToWidget(),
          ],
        ),
      ),
    );
  }
}
