import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';

import 'package:mengo_delivery/controllers/delivery_controller.dart';

import 'widgets/sender_form.dart';
import 'widgets/sender_form_bottom_bar.dart';

class SenderMainPage extends StatelessWidget {
  SenderMainPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DeliveryController _controller = Get.find<DeliveryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sender Details"),
        leading: const CustomBackButton(),
      ),
      body: SenderForm(controller: _controller, formKey: _formKey),
      bottomNavigationBar:
          SenderFormBottomBar(controller: _controller, formKey: _formKey),
    );
  }
}
