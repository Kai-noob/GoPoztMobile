import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/auth_controller.dart';
import 'package:mengo_delivery/services/api_call_status.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../components/auth_clipper.dart';
import '../../utils/app_colors.dart';
import 'widgets/login_button_widget.dart';
import 'widgets/login_forgot_password_widget.dart';
import 'widgets/login_password_widget.dart';
import 'widgets/login_phone_widget.dart';
import 'widgets/login_signup_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
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
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const AuthClipper(),
                  const SizedBox(height: 30),
                  LoginPhoneWidget(phoneController: phoneController),
                  const SizedBox(height: 20),
                  LoginPasswordWidget(passwordController: passwordController),
                  const SizedBox(height: 25),
                  LoginButtonWidget(
                    formKey: formKey,
                    authController: authController,
                    phoneController: phoneController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 20),
                  const LoginForgotPasswordWidget(),
                  const SizedBox(height: 40),
                  const LoginSignUpWidget(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
