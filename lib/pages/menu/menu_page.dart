import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/menu_controller.dart';
import 'package:mengo_delivery/pages/history/history_page.dart';
import 'package:mengo_delivery/pages/home/home_page.dart';
import 'package:mengo_delivery/pages/notification/notification_page.dart';
import 'package:mengo_delivery/pages/settings/setting_page.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

class MenuPage extends StatelessWidget {
  final CustomMenuController menuController = Get.put(CustomMenuController());

  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: menuController.selectedIndex.value,
            children: const [
              // HomeAppBarWidget(),
              HomePage(),
              HistoryPage(),
              NotificationPage(),
              SettingPage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: menuController.selectedIndex.value,
          onTap: menuController.changePage,
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: primaryTextStyle(
              color: Colors.black, weight: FontWeight.normal, size: 14),
          items: [
            BottomNavigationBarItem(icon: AppConstants.homeIcon, label: 'Home'),
            BottomNavigationBarItem(
              icon: AppConstants.historyIcon,
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: AppConstants.notiIcon,
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: AppConstants.settingIcon,
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
