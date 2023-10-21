import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/auth_clipper.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/auth_controller.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../network/api_call_status.dart';
import '../../utils/app_colors.dart';
import 'widgets/sign_up_button_widget.dart';
import 'widgets/sign_up_login_widget.dart';
import 'widgets/sign_up_name_widget.dart';
import 'widgets/sign_up_password_widget.dart';
import 'widgets/sign_up_phone_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      final TextEditingController nameController = TextEditingController();
      final TextEditingController phoneController = TextEditingController();
      final TextEditingController passwordController = TextEditingController();
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
      return OverlayLoaderWithAppIcon(
        isLoading: authController.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: Image.asset('assets/icons/icon.png'),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                const AuthClipper(),
                const CustomVerticalSpacer(height: 30),
                SignUpNameWidget(nameController: nameController),
                const CustomVerticalSpacer(height: 20),
                SignUpPhoneWidget(phoneController: phoneController),
                const CustomVerticalSpacer(height: 20),
                SignUpPasswordWidget(passwordController: passwordController),
                const CustomVerticalSpacer(height: 25),
                SignUpButtonWidget(
                    formKey: formKey,
                    authController: authController,
                    nameController: nameController,
                    phoneController: phoneController,
                    passwordController: passwordController),
                const CustomVerticalSpacer(height: 40),
                const SignUpLoginWidget()
              ],
            ),
          ),
        ),
      );
    });
  }
}
