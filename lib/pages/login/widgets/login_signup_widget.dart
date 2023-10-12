import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';


class LoginSignUpWidget extends StatelessWidget {
  const LoginSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Don't have an Account ? ",
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.register);
          },
          child: const Text("Sign Up ",
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
