import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/auth_controller.dart';

import '../../components/auth_clipper.dart';

import 'widgets/login_button_widget.dart';
import 'widgets/login_forgot_password_widget.dart';
import 'widgets/login_password_widget.dart';
import 'widgets/login_phone_widget.dart';
import 'widgets/login_signup_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const AuthClipper(),
            const CustomVerticalSpacer(height: 30),
            LoginPhoneWidget(phoneController: _phoneController),
            const CustomVerticalSpacer(height: 20),
            LoginPasswordWidget(passwordController: _passwordController),
            const CustomVerticalSpacer(height: 25),
            LoginButtonWidget(
                formKey: _formKey,
                authController: _authController,
                phoneController: _phoneController,
                passwordController: _passwordController),
            const CustomVerticalSpacer(height: 20),
            const LoginForgotPasswordWidget(),
            const CustomVerticalSpacer(height: 40),
            const LoginSignUpWidget()
          ],
        ),
      ),
    );
  }
}
