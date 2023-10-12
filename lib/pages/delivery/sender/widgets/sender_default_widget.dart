import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/app_colors.dart';


class SenderDefaultWidget extends StatelessWidget {
  const SenderDefaultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(children: [
        Text(
          "Set as default",
          style: boldTextStyle(size: 12, weight: FontWeight.normal),
        ),
        SizedBox(
          width: 7.w,
        ),
        MSHCheckbox(
          size: 15,
          value: false,
          colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
            checkedColor: primaryColor,
          ),
          style: MSHCheckboxStyle.fillScaleColor,
          onChanged: (selected) {
            // setState(() {
            //   isBroke = selected;
            // });
          },
        ),
      ]),
    );
  }
}