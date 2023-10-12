import 'package:flutter/material.dart';
import 'package:mengo_delivery/pages/app_page.dart';
import 'helpers/instance_helper.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();
  runApp(App(
    languages: languages,
  ));
}
