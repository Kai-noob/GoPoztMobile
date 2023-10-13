import 'package:flutter/material.dart';
import 'package:mengo_delivery/pages/app_page.dart';
import 'package:mengo_delivery/utils/app_cache_part.dart';
import 'helpers/instance_helper.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();
  await AppCachePathProvider.initPath();
  runApp(App(
    languages: languages,
  ));
}
