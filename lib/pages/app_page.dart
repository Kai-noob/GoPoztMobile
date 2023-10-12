import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mengo_delivery/bindings/init_binding.dart';
import 'package:mengo_delivery/controllers/localization_controller.dart';

import 'package:mengo_delivery/helpers/theme_helper.dart';

import '../routes/app_pages.dart';
import '../utils/app_constants.dart';
import '../utils/messages.dart';

class App extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const App({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<LocalizationController>(
            builder: (localizationController) {
          return GlobalLoaderOverlay(
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeHelper.lightTheme,
              translations: Messages(languages: languages),
              fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
                  AppConstants.languages[0].countryCode),
              locale: localizationController.locale,
              initialRoute:
                  AppPages.INITIAL, // first screen to show when app is running
              getPages: AppPages.routes,
              initialBinding: InitBinding(),
            ),
          );
        });
      },
    );
  }
}
