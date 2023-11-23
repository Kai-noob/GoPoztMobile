import 'package:get/get.dart';
import 'package:mengo_delivery/bindings/delivery_binding.dart';
import 'package:mengo_delivery/bindings/receiver_binding.dart';
import 'package:mengo_delivery/bindings/sender_binding.dart';
import 'package:mengo_delivery/pages/delivery/delivery_main_page.dart';
import 'package:mengo_delivery/pages/delivery/receiver/receiver_main_page.dart';

import 'package:mengo_delivery/pages/home/home_page.dart';
import 'package:mengo_delivery/pages/login/login_page.dart';
import 'package:mengo_delivery/pages/menu/menu_page.dart';
import 'package:mengo_delivery/pages/signup/sign_up_page.dart';
import 'package:mengo_delivery/pages/splash/splash_page.dart';

import '../bindings/auth_binding.dart';
import '../bindings/splash_binding.dart';
import '../pages/delivery/sender/sender_main_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardPage(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const SignUpPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: _Paths.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: _Paths.delivery,
        page: () =>  DeliveryMainPage(),
        binding: DeliveryBinding()),
    GetPage(
        name: _Paths.recipient,
        page: () => ReceiverMainPage(),
        binding: ReceiverBinding()),
    GetPage(
        name: _Paths.sender,
        page: () => SenderMainPage(),
        binding: SenderBinding()),
  ];
}
