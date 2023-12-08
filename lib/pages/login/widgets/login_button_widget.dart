import 'package:flutter/material.dart';

import '../../../controllers/auth_controller.dart';
import '../../../models/login_model.dart';
import '../../../utils/app_colors.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required AuthController authController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
   required this.ctx
  })  : _formKey = formKey,
        _authController = authController,
        _phoneController = phoneController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final AuthController _authController;
  final TextEditingController _phoneController;
  final TextEditingController _passwordController;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: primaryColor),
          child: TextButton(
            child: const Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _authController.login(
                    LoginModel(
                        phone: _phoneController.text,
                        password: _passwordController.text),
                    ctx);
              } else {
                print("Error");
              }
            },
          ),
        ));
  }
}
