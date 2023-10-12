import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButtonWidget(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFAA33),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
          onPressed: onPressed,
          child: Text(
            title,
            style:
                boldTextStyle(color: white, size: 16, weight: FontWeight.w500),
          )),
    );
  }

  ///FDSJFSD
}
