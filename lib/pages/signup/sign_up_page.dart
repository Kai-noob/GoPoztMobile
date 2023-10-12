import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/auth_clipper.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/auth_controller.dart';

import 'widgets/sign_up_button_widget.dart';
import 'widgets/sign_up_login_widget.dart';
import 'widgets/sign_up_name_widget.dart';
import 'widgets/sign_up_password_widget.dart';
import 'widgets/sign_up_phone_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController _authController = Get.find<AuthController>();

  final TextEditingController _nameController = TextEditingController();
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
            SignUpNameWidget(nameController: _nameController),
            const CustomVerticalSpacer(height: 20),
            SignUpPhoneWidget(phoneController: _phoneController),
            const CustomVerticalSpacer(height: 20),
            SignUpPasswordWidget(passwordController: _passwordController),
            const CustomVerticalSpacer(height: 25),
            SignUpButtonWidget(
                formKey: _formKey,
                authController: _authController,
                nameController: _nameController,
                phoneController: _phoneController,
                passwordController: _passwordController),
            const CustomVerticalSpacer(height: 40),
            const SignUpLoginWidget()
          ],
        ),
      ),
    );
  }
}
