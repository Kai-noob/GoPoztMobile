import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/pages/delivery/receiver/widgets/receiver_confirm_widget.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateOrderWayCountWidget extends StatelessWidget {
  final ReceiverController controller;
  const CreateOrderWayCountWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return controller.parcels.isEmpty
        ? const SizedBox()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10)),
            child: Text(
              "WAY ${controller.parcels.length}",
              style: TextStyle(color: white, fontSize: 11.sp),
            ),
          );
  }
}
