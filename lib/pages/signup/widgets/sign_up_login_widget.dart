import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';


class SignUpLoginWidget extends StatelessWidget {
  const SignUpLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "You have already an account ? ",
          style: TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.normal),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.login);
          },
          child: const Text("Login ",
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
