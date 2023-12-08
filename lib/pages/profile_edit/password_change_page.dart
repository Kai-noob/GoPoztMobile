import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/helpers/snackbar_helper.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../controllers/profile_controller.dart';
import '../../network/api_call_status.dart';
import '../../utils/app_colors.dart';

class PasswordChangePage extends StatelessWidget {
  const PasswordChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        leading: CustomBackButton(onTap: () {
          Get.back();
        }),
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return OverlayLoaderWithAppIcon(
            isLoading: controller.apiCallStatus == ApiCallStatus.loading,
            overlayBackgroundColor: Colors.black,
            circularProgressColor: primaryColor,
            appIcon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/icons/logo.png')),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // -- IMAGE with ICON

                    // -- Form Fields
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              controller.setNewPassword(value);
                            },
                            decoration: const InputDecoration(
                                label: Text("New Password"),
                                prefixIcon: Icon(LineIcons.lock)),
                          ),
                          const CustomVerticalSpacer(height: 10),
                          TextFormField(
                            onChanged: (value) {
                              controller.setConfirmPassword(value);
                            },
                            decoration: const InputDecoration(
                                label: Text("Confirm New Password"),
                                prefixIcon: Icon(LineIcons.lock)),
                          ),

                          const CustomVerticalSpacer(height: 25),

                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // print(_imageFile!.path);
                                if (controller.validatePasswords()) {
                                  controller.updatePassword(
                                      context, controller.newPassword);
                                } else {
                                  SnackBarHelper.showErrorMessage(
                                      context: context,
                                      title: "Passwords don't match");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child: Text("Save",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp)),
                            ),
                          ),
                          // const SizedBox(height: tFormHeight),

                          // -- Created Date and Delete Button
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
