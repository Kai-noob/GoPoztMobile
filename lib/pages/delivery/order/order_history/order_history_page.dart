import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mengo_delivery/components/custom_divider.dart';

import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:nb_utils/nb_utils.dart';


import 'widgets/order_history_cancel_button_widget.dart';
import 'widgets/order_history_date_widget.dart';
import 'widgets/order_history_deli_fee_widget.dart';
import '../order_details/order_details_page.dart';
import 'widgets/order_history_delivery_id_widget.dart';
import 'widgets/order_history_id_widget.dart';
import 'widgets/order_history_phone_call_widget.dart';
import 'widgets/order_history_prepaid_fee_widget.dart';
import 'widgets/order_history_status_widget.dart';
import 'widgets/order_history_way_widget.dart';
import 'widgets/order_history_search_field_widget.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      children: [
        const CustomVerticalSpacer(height: 10),
        const OrderHistorySearchFieldWidget(),
        const CustomVerticalSpacer(height: 5),
        InkWell(
          onTap: () {
            Get.to(() => const OrderDetailsPage());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              const Row(
                children: [
                  OrderHistoryIdWidget(),
                  Spacer(),
                  OrderHistoryDateWidget(),
                  Spacer(),
                  OrderHistoryStatusWidget()
                ],
              ),
              const CustomVerticalSpacer(height: 5),
              const Row(
                children: [
                  Expanded(child: Icon(LineIcons.bicycle)),
                  OrderHistoryDeliveryIdWidget(),
                  OrderHistoryPhoneCallWidget(),
                  OrderHistoryCancelWidget(),
                ],
              ),
              const CustomVerticalSpacer(height: 5),
              const CustomDivider(
                  color: Colors.black,
                  thickness: 0.8,
                  endIndent: 15,
                  indent: 15),
              const OrderHistoryWayWidget(),
              const SizedBox(height: 10),
              const OrderHistoryDeliFeeWidget(),
              4.verticalSpace,
              const OrderHistoryPrepaidFeeWidget(),
              const CustomDivider(
                  color: Colors.black,
                  thickness: 0.8,
                  endIndent: 15,
                  indent: 15),
              const OrderHistoryWayWidget(),
              const SizedBox(height: 10),
              const OrderHistoryDeliFeeWidget(),
              const CustomVerticalSpacer(height: 4),
              const OrderHistoryPrepaidFeeWidget(),
              const CustomDivider(
                  color: Colors.black,
                  thickness: 0.8,
                  endIndent: 15,
                  indent: 15),
            ]),
          ),
        )
      ],
    );
  }
}
