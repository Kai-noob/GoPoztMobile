import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';

import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../../network/api_call_status.dart';
import 'widgets/sender_form.dart';
import 'widgets/sender_form_bottom_bar.dart';

class SenderMainPage extends StatelessWidget {
  SenderMainPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SenderController>(builder: (controller) {
      return OverlayLoaderWithAppIcon(
         isLoading: controller.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: ClipRRect(
           borderRadius: BorderRadius.circular(100),
          child: Image.asset('assets/icons/logo.png')),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Sender Details"),
            leading:  CustomBackButton(
              onTap: (){
                Get.back();
              },
            ),
          ),
          body: SenderForm(controller: controller, formKey: _formKey),
          bottomNavigationBar:
              SenderFormBottomBar(controller: controller, formKey: _formKey),
        ),
      );
    });
  }
}
