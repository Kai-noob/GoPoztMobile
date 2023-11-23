import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mengo_delivery/pages/app_page.dart';
import 'package:mengo_delivery/utils/app_cache_part.dart';
import 'package:permission_handler/permission_handler.dart';
import 'helpers/instance_helper.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  Map<String, Map<String, String>> languages = await di.init();
  await AppCachePathProvider.initPath();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
   await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessageBackgound);
  runApp(App(
    languages: languages,
  ));
}


@pragma('vm:entry-point')
Future<void> _firebaseMessageBackgound(RemoteMessage message) async {
  Firebase.initializeApp();
  // print(message.notification!.title.toString());
}
