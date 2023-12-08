import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

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
            context.setLocale(const Locale('my', 'MM'));
            EasyLoading.show(status: "Changing..");
            Restart.restartApp();
            EasyLoading.show(status: "Changing..");

            // _localizationController.setLanguage(const Locale('mm'));
          },
        ),
        ListTile(
          title: const Text("English"),
          onTap: () {
            context.setLocale(const Locale('en', 'US'));
            EasyLoading.show(status: "Changing..");

            Restart.restartApp();
            EasyLoading.dismiss();

            // _localizationController.setLanguage(const Locale('en'));
          },
        ),
        ListTile(
          title: const Text('hello').tr(),
        )
      ]),
    );
  }
}
