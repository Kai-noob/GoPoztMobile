import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: blackColor,
        size: 22,
      ),
    );
  }
}
