import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/appbar_widget.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:mengo_delivery/utils/app_images.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderDetailsMainPage extends StatelessWidget {
  const OrderDetailsMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Order #12344",
        isBackIconShow: true,
        onBackIconPressed: () => Get.back(),
      ),
      body: ListView(padding: AppConstants.defaultPadding, children: [
        ExpansionTile(
            title: Text(
              "နေရပ်လိပ်စာ",
              style: primaryTextStyle(
                  color: black, size: 14, weight: FontWeight.normal),
            ),
            leading: SvgPicture.asset(
              pickupAddress,
              height: 22,
            )),
        AppConstants.defaultSpacer,
        ExpansionTile(
            title: Text(
              "ပို့ဆောင်သူ",
              style: primaryTextStyle(
                  color: black, size: 14, weight: FontWeight.normal),
            ),
            leading: SvgPicture.asset(
              deliveryMane,
              height: 22,
            ))
      ]),
    );
  }
}
