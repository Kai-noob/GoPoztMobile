import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/controllers/notification_controller.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../network/api_call_status.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (controller) {
      return OverlayLoaderWithAppIcon(
        isLoading: controller.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/icons/logo.png')),
        child: Scaffold(
          appBar: AppBar(
            leading: CustomBackButton(onTap: () {
              Get.back();
            }),
            title: const Text("Notifications"),
          ),
          body: ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                    backgroundColor: primaryColor.withOpacity(0.9),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    )),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.notifications[index].data['description']}",
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy h:mma').format(DateTime.parse(
                          controller.notifications[index].createdAt)),
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  "${controller.notifications[index].data['title']}",
                  style: primaryTextStyle(
                      color: blackColor, size: 13, weight: FontWeight.w500),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
