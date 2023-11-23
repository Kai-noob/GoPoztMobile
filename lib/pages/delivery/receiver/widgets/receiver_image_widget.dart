import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../controllers/receiver_controller.dart';


class ReceiverImageWidget extends StatelessWidget {
  final ReceiverController controller;
  const ReceiverImageWidget({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.selectImagesAndUpload();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: black),
            borderRadius: BorderRadius.circular(5)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.camera_alt),
          5.verticalSpace,
          Text(
            "0/3",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}