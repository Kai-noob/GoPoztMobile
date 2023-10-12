import 'package:flutter/material.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';

import '../../../utils/app_colors.dart';



class SignUpPasswordWidget extends StatelessWidget {
  const SignUpPasswordWidget({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 0.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          controller: _passwordController,
          obscureText: true,
          validator: ValidatorHelper().signUpPasswordValidator,
          cursorColor: Colors.deepOrange,
          decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Material(
                elevation: 0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Icon(Icons.lock, color: primaryColor),
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ),
    );
  }


}
