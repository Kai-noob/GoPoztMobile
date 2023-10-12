import 'package:flutter/material.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';

import '../../../utils/app_colors.dart';


class SignUpNameWidget extends StatelessWidget {
  const SignUpNameWidget({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 0.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          controller: _nameController,
          cursorColor: Colors.deepOrange,
          validator: ValidatorHelper().nameValidator,
          decoration: const InputDecoration(
              hintText: "Name",
              prefixIcon: Material(
                elevation: 0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Icon(
                  Icons.person_outline,
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
