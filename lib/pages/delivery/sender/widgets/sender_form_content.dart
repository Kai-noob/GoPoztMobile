import 'package:flutter/material.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';

import '../../../../components/custom_divider.dart';
import '../../../../controllers/delivery_controller.dart';
import 'sender_address_widget.dart';
import 'sender_city_area_widget.dart';
import 'sender_default_widget.dart';
import 'sender_name_and_phone_widget.dart';
import 'sender_note_widget.dart';
import 'sender_section_title.dart';
import 'sender_time_widget.dart';

class SenderFormContent extends StatelessWidget {
  final DeliveryController controller;

  const SenderFormContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomVerticalSpacer(height: 10),
          const SenderSectionTitle(title: "Sender address"),
          SenderNameAndPhone(controller: controller),
          const CustomDivider(
            color: Colors.black,
            endIndent: 15,
            indent: 15,
          ),
          SenderCityAreaWidget(controller: controller),
          const CustomDivider(
            color: Colors.black,
            endIndent: 15,
            indent: 15,
          ),
          SenderAddressWidget(controller: controller),
          const CustomDivider(
            color: Colors.black,
            endIndent: 15,
            indent: 15,
          ),
          SenderTimeWidget(controller: controller),
          const CustomDivider(
            color: Colors.black,
            endIndent: 15,
            indent: 15,
          ),
          SenderNoteWidget(controller: controller),
          const CustomDivider(
            color: Colors.black,
            endIndent: 15,
            indent: 15,
          ),
          const CustomVerticalSpacer(height: 8),
          const SenderDefaultWidget(),
          const CustomVerticalSpacer(height: 8),
        ],
      ),
    );
  }
}
