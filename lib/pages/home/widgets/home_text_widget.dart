import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeTextWidget extends StatelessWidget {
  final String text;
  const HomeTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: boldTextStyle(color: blackColor, size: 17),
    );
  }
}
