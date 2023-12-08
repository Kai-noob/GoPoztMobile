import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/notification_controller.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:mengo_delivery/utils/app_images.dart';
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.all(10),
                  // leading: CircleAvatar(
                  //     backgroundColor: primaryColor.withOpacity(0.9),
                  //     child: AppConstants.notiIcon),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.notifications[index].data['description']}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        const CustomVerticalSpacer(height: 5),
                        Text(
                          DateFormat('dd-MM-yyyy h:mma').format(DateTime.parse(
                              controller.notifications[index].createdAt)),
                          style: TextStyle(
                            fontSize: 11.0.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    "${controller.notifications[index].data['title']}",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
