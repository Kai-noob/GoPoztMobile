import 'package:flutter/material.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';

import '../../../utils/app_colors.dart';


class LoginPhoneWidget extends StatelessWidget {
  const LoginPhoneWidget({
    super.key,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 0.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          controller: _phoneController,
          cursorColor: Colors.deepOrange,
          validator: ValidatorHelper().phoneValidator,
          decoration: const InputDecoration(
              hintText: "Phone",
              prefixIcon: Material(
                elevation: 0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Icon(
                  Icons.phone,
                  color: primaryColor,
                ),
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ),
    );
  }

   
}

