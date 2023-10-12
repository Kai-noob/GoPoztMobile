import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart';
import 'package:mengo_delivery/controllers/menu_controller.dart';
import 'package:mengo_delivery/routes/app_pages.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

import '../../utils/unicorn_icon_widdget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    Get.find<DashboardController>().selectHomePage(isUpdate: false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (menuController) {
      return Scaffold(
        body: PageStorage(bucket: bucket, child: menuController.currentScreen),
        floatingActionButton: UnicornOutlineButton(
            strokeWidth: 1.5,
            radius: 50,
            onPressed: () {},
            child: FloatingActionButton(
                backgroundColor: primaryColor,
                elevation: 1,
                onPressed: () {
                  Get.toNamed(Routes.delivery);
                },
                child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: BoxIso(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    )))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Get.find<DashboardController>().selectHomePage();
                  },
                  icon: const HomeSimpleDoor()),
              IconButton(
                  onPressed: () {
                    Get.find<DashboardController>().selectHistoryPage();
                  },
                  icon: const Clock()),
              IconButton(
                  onPressed: () {
                    Get.find<DashboardController>().selectNotificationPage();
                  },
                  icon: const BellNotification()),
              IconButton(
                  onPressed: () {
                    Get.find<DashboardController>().selectSettingPage();
                  },
                  icon: const UserCircle()),
            ],
          ),
        ),
      );
    });
  }
}
