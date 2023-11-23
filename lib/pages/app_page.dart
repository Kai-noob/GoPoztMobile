import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mengo_delivery/bindings/init_binding.dart';
import 'package:mengo_delivery/controllers/localization_controller.dart';

import 'package:mengo_delivery/helpers/theme_helper.dart';
import 'package:pusher_client_fixed/pusher_client_fixed.dart';

import '../helpers/shared_pref_helper.dart';
import '../routes/app_pages.dart';
import '../utils/app_constants.dart';
import '../utils/messages.dart';

// const String appId = "1321495";
const String key = "1f6902759d543861834e";
const String cluster = "ap1";
const String hostEndPoint = "http://gopozt.ap-southeast-1.elasticbeanstalk.com";
const String hostAuthEndPoint = "http://$hostEndPoint/broadcasting/auth";
// const String token = "2|2gAA0Z1w43jasatIFaw0MD3H8LSDeGIoK2sCtTDw6ac6eb51";
// const String channelName = 'private-messages';
// const String eventName = 'MessageCreatedEvent';

class App extends StatefulWidget {
  final Map<String, Map<String, String>> languages;
  const App({super.key, required this.languages});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late PusherClient pusherClient;
  late Channel channel;

  @override
  void initState() {
    super.initState();
    initPusher();
  }

  void initPusher() {
    print("User Id ${MySharedPref.getUserId()}");
    pusherClient = PusherClient(
      key,
      PusherOptions(
        host: hostEndPoint,
        encrypted: true,

        cluster: cluster,
        auth: PusherAuth(
          hostAuthEndPoint,
          headers: {'Authorization': 'Bearer ${MySharedPref.getToken()}'},
        ),
      ),
      autoConnect: false,
      enableLogging: true,
    );

    pusherClient.connect();

    pusherClient.onConnectionStateChange((state) {
      log(
        "previousState: ${state?.previousState}, currentState: ${state?.currentState}, socketId: ${pusherClient.getSocketId()}",
      );
      if (state?.currentState == 'CONNECTED') {
        channel = pusherClient
            .subscribe('App.Models.User.${MySharedPref.getUserId()}');

    print(channel.name);
      }
    });

    pusherClient.onConnectionError((error) {
      log("error: ${error?.message}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<LocalizationController>(
            builder: (localizationController) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeHelper.lightTheme,
            translations: Messages(languages: widget.languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
                AppConstants.languages[0].countryCode),
            locale: localizationController.locale,
            initialRoute:
                AppPages.INITIAL, // first screen to show when app is running
            getPages: AppPages.routes,
            initialBinding: InitBinding(),
          );
        });
      },
    );
  }

  @override
  void dispose() {
pusherClient.unsubscribe('App.Models.User.${MySharedPref.getUserId()}');
    pusherClient.disconnect();
    super.dispose();
  }
}
