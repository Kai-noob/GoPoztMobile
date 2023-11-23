import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconoir_flutter/box_iso.dart';
import 'package:iconoir_flutter/clock.dart';
import 'package:iconoir_flutter/home_simple_door.dart';
import 'package:iconoir_flutter/user_circle.dart';
import 'package:mengo_delivery/controllers/menu_controller.dart';
import 'package:mengo_delivery/pages/history/history_page.dart';
import 'package:mengo_delivery/pages/home/home_page.dart';
import 'package:mengo_delivery/pages/settings/setting_page.dart';
import 'package:mengo_delivery/routes/app_pages.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/unicorn_icon_widdget.dart';

class DashboardPage extends GetView<CustomMenuController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PageStorage(bucket: bucket, child: menuController.currentScreen),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          elevation: 1,
          onPressed: () {
            Get.toNamed(Routes.delivery,arguments: {
              'partner_id':null,
              'isPartner':false
            });
          },
          label: Text(
            "ပါဆယ်ပို့ရန်",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp),
          ),
          icon: const Padding(
              padding: EdgeInsets.all(5.0),
              child: BoxIso(
                height: 30,
                width: 24,
                color: Colors.white,
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: const [
            // HomeAppBarWidget(),
            HomePage(),
            HistoryPage(),
            SettingPage()
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 60,
      //   decoration: const BoxDecoration(
      //     color: primaryColor,
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //           onPressed: () {
      //             Get.find<DashboardController>().selectHomePage();
      //           },

      //       IconButton(
      //           onPressed: () {
      //             Get.find<DashboardController>().selectHistoryPage();
      //           },
      //           icon: const Clock(
      //             height: 24,
      //             color: Colors.white,
      //           )),
      //       IconButton(
      //           onPressed: () {
      //             Get.find<DashboardController>().selectNotificationPage();
      //           },
      //           icon: const BellNotification(
      //             height: 24,
      //             color: Colors.white,
      //           )),
      //       IconButton(
      //           onPressed: () {
      //             Get.find<DashboardController>().selectSettingPage();
      //           },
      //           icon: const UserCircle(
      //             height: 24,
      //             color: Colors.white,
      //           )),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          backgroundColor: primaryColor,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp),
          unselectedLabelStyle: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp),
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: HomeSimpleDoor(
                height: 24,
                color: Colors.white70,
              ),
              activeIcon: HomeSimpleDoor(
                height: 24,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Clock(
                height: 24,
                color: Colors.white70,
              ),
              activeIcon: Clock(
                height: 24,
                color: Colors.white,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: UserCircle(
                height: 24,
                color: Colors.white70,
              ),
              activeIcon: UserCircle(
                height: 24,
                color: Colors.white,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
