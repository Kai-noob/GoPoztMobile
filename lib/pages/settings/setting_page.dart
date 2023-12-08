import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mengo_delivery/controllers/profile_controller.dart';
import 'package:mengo_delivery/pages/profile_edit/password_change_page.dart';
import 'package:mengo_delivery/pages/profile_edit/profile_edit_page.dart';
import 'package:mengo_delivery/pages/settings/language_page.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:share_plus/share_plus.dart';

import '../../network/api_call_status.dart';
import '../../utils/app_colors.dart';
import 'widgets/logout_dialog.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return OverlayLoaderWithAppIcon(
        isLoading: controller.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/icons/logo.png')),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Setting"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                // SmallUserCard(
                //   cardRadius: 20,
                //   cardColor: primaryColor,
                //   onTap: () {},
                //   userProfilePic:
                // CachedNetworkImageProvider(
                //                             controller.userModel.profile ??
                //                                 ""),
                //   userName: controller.userModel.name,
                //   userMoreInfo: Text(
                //     controller.userModel.phone??"",
                //     style: TextStyle(color: Colors.white, fontSize: 14.sp),
                //   ),
                // ),
                // Text(controller.userModel.name),
                // User card
                // BigUserCard(
                //   settingColor: Colors.white,
                //   // cardColor: Colors.red,
                //   userName: controller.userModel.name,
                //   // backgroundColor: primaryColor,
                //   userMoreInfo: Column(children: [
                //     Text(
                //       controller.userModel.phone,
                //       style: const TextStyle(
                //           color: Colors.black,
                //           fontSize: 14,
                //           fontWeight: FontWeight.w500),
                //     )
                //   ]),

                //   userProfilePic:
                //       const
                //   cardActionWidget: SettingsItem(
                //     icons: Icons.edit,
                //     iconStyle: IconStyle(
                //       withBackground: true,
                //       borderRadius: 50,
                //       backgroundColor: Colors.yellow[600],
                //     ),
                //     title: "Edit Profile",
                //     subtitle: "Tap to change your data",
                //     onTap: () {
                //       print("OK");
                //     },
                //   ),
                // ),
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {
                        Get.to(() => const ProfileEditPage());
                      },
                      titleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      icons: Icons.edit,
                      iconStyle: IconStyle(
                          iconsColor: Colors.white,
                          withBackground: true,
                          backgroundColor: primaryColor),
                      title: 'Edit Profile',
                      subtitle: "Tap to change your profile",
                    ),
                    SettingsItem(
                      onTap: () {
                        Get.to(() => const LanguagePage());
                      },
                      titleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      icons: Icons.language,
                      iconStyle: IconStyle(
                          backgroundColor: primaryColor,
                          iconsColor: Colors.white),
                      title: 'Language',
                      subtitle: "Myanmar",
                    ),
                  ],
                ),
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.info,
                      titleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      iconStyle: IconStyle(backgroundColor: primaryColor),
                      title: 'About',
                      // subtitle: "Learn more about Mengo Delivery App",
                    ),
                    SettingsItem(
                      onTap: () {
                        Share.share(
                            'https://play.google.com?id=com.deliverymm.app');
                      },
                      titleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      icons: Icons.share,
                      iconStyle: IconStyle(backgroundColor: primaryColor),
                      title: 'Share',
                      // subtitle: "Learn more about Ziar'App",
                    ),
                    SettingsItem(
                      onTap: () {},
                      titleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      icons: Icons.book,
                      iconStyle: IconStyle(backgroundColor: primaryColor),
                      title: 'Terms&Conditions',
                      // subtitle: "Learn more about Mengo Delivery App",
                    ),
                  ],
                ),
                // You can add a settings title
                SettingsGroup(
                  settingsGroupTitle: "Account",
                  settingsGroupTitleStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  items: [
                    SettingsItem(
                      onTap: () {
                        Get.to(() => const PasswordChangePage());
                      },
                      titleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      icons: Icons.change_circle,
                      iconStyle: IconStyle(
                          iconsColor: Colors.white,
                          withBackground: true,
                          backgroundColor: primaryColor),
                      title: 'Change Password',
                    ),
                    SettingsItem(
                      onTap: () {
                        showLogoutDialog(context, () {
                          controller.logout(context);
                        });
                      },
                      titleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      icons: Icons.logout,
                      iconStyle: IconStyle(
                          iconsColor: Colors.white,
                          withBackground: true,
                          backgroundColor: primaryColor),
                      title: "Logout",
                    ),
                    // SettingsItem(
                    //   onTap: () {},
                    //   icons: Icons.delete_outline,
                    //   title: "Delete account",
                    //   titleStyle: const TextStyle(
                    //     color: Colors.red,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void showLogoutDialog(BuildContext context, VoidCallback onTap) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutDialog(
          onTap: onTap,
        );
      },
    );
  }
}
