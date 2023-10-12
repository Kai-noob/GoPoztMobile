import 'package:flutter/material.dart';

import 'package:mengo_delivery/controllers/delivery_controller.dart';

import 'package:mengo_delivery/utils/app_constants.dart';

import 'sender_form_content.dart';


class SenderForm extends StatelessWidget {
  final DeliveryController controller;
  final GlobalKey<FormState> formKey;

  const SenderForm({
    super.key,
    required this.controller,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
     
      child: ListView(
        padding: AppConstants.defaultPadding,
        children: [
          SenderFormContent(controller: controller),
        ],
      ),
    );
  }
}



