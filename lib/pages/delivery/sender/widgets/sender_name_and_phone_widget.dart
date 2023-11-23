import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:mengo_delivery/pages/delivery/sender/widgets/sender_phone_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../controllers/delivery_controller.dart';
import 'sender_name_widget.dart';


class SenderNameAndPhone extends StatelessWidget {
  final SenderController controller;

  const SenderNameAndPhone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Row(
        children: [
          SenderNameWidget(controller: controller),
          const Expanded(
            child: VerticalDivider(
              color: black,
              width: 20,
              indent: 10,
              endIndent: 10,
            ),
          ),
          SenderPhoneWidget(controller: controller),
        ],
      ),
    );
  }
}