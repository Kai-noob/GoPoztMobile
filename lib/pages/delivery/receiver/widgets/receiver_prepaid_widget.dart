import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../controllers/delivery_controller.dart';
import '../../../../utils/app_colors.dart';

class ReceiverPrepaidWidget extends StatelessWidget {
  const ReceiverPrepaidWidget({
    super.key,
    required this.controller,
  });

  final ReceiverController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Obx(
          () => Row(children: [
            Text(
              "Prepaid",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              width: 7.w,
            ),
            MSHCheckbox(
              size: 15,
              value: controller.isPrepaid,
              colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                checkedColor: primaryColor,
              ),
              style: MSHCheckboxStyle.fillScaleColor,
              onChanged: (selected) {
                controller.changePrepaid(controller.isPrepaid);
              },
            ),
          ]),
        ));
  }
}
