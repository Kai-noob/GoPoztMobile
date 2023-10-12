import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/localization_controller.dart';

class LanguagePage extends StatelessWidget {
  LanguagePage({super.key});

  final LocalizationController _localizationController =
      Get.find<LocalizationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language"),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text("Myanmar"),
          onTap: () {
            _localizationController.setLanguage(const Locale('mm'));
          },
        ),
        ListTile(
          title: const Text("English"),
          onTap: () {},
        )
      ]),
    );
  }
}
