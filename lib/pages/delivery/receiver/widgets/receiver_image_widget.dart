import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../controllers/receiver_controller.dart';

class ReceiverImageWidget extends StatelessWidget {
  final ReceiverController controller;
  const ReceiverImageWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.selectImagesAndUpload();
        },
        child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: black),
                borderRadius: BorderRadius.circular(5)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              controller.parcelPhotos.isEmpty
                  ? const Icon(Icons.camera_alt)
                  : SizedBox(
                      height: 40,
                      child: Image.file(controller.parcelPhotos[0])),
              5.verticalSpace,
              Text(
                "${controller.parcelPhotos.length}/3",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ));
  }
}
