import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/pages/history/widgets/history_card.dart';
import 'package:mengo_delivery/pages/history/history_page.dart';
import 'package:mengo_delivery/pages/home/home_page.dart';
import 'package:mengo_delivery/pages/notification/notification_page.dart';
import 'package:mengo_delivery/pages/settings/setting_page.dart';

// class DashboardController extends GetxController implements GetxService {
//   @override
//   void onInit() {
//     selectHistoryPage();
//     super.onInit();
//   }

//   int _currentTab = 0;
//   int get currentTab => _currentTab;
//   final List<Widget> screen = [
//      HomePage(),
//     const HistoryPage(),
//     const NotificationPage(),
//      SettingPage(),
//   ];
//   Widget _currentScreen =  HomePage();
//   Widget get currentScreen => _currentScreen;

//   resetNavBar() {
//     _currentScreen =  HomePage();
//     _currentTab = 0;
//   }

//   selectHomePage({bool isUpdate = true}) {
//     _currentScreen =  HomePage();
//     _currentTab = 0;
//     if (isUpdate) {
//       update();
//     }
//   }

//   selectHistoryPage() {
//     _currentScreen = const HistoryPage();
//     _currentTab = 1;
//     update();
//   }

//   selectNotificationPage() {
//     _currentScreen = const NotificationPage();
//     _currentTab = 2;
//     update();
//   }

//   selectSettingPage() {
//     _currentScreen =  SettingPage();
//     _currentTab = 3;
//     update();
//   }
// }



class CustomMenuController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
