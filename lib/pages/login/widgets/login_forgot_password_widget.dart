import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';


class LoginForgotPasswordWidget extends StatelessWidget {
  const LoginForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "FORGOT PASSWORD ?",
        style: TextStyle(
            color: primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}