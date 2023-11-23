import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomBackButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:onTap,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}
