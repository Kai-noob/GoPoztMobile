import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mengo_delivery/controllers/profile_controller.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../services/api_call_status.dart';
import '../../utils/app_colors.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return OverlayLoaderWithAppIcon(
        isLoading: controller.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: Image.asset('assets/icons/icon.png'),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Setting"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                // User card
                BigUserCard(
                  settingColor: Colors.white,
                  // cardColor: Colors.red,
                  userName: controller.userModel.name,
                  // backgroundColor: primaryColor,
                  userMoreInfo: Column(children: [
                    Text(
                      controller.userModel.phone,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ]),

                  userProfilePic:
                      const AssetImage("assets/images/profile.jpeg"),
                  cardActionWidget: SettingsItem(
                    icons: Icons.edit,
                    iconStyle: IconStyle(
                      withBackground: true,
                      borderRadius: 50,
                      backgroundColor: Colors.yellow[600],
                    ),
                    title: "Edit Profile",
                    subtitle: "Tap to change your data",
                    onTap: () {
                      print("OK");
                    },
                  ),
                ),
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.language,
                      iconStyle: IconStyle(),
                      title: 'Language',
                      subtitle: "Myanmar",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.dark_mode,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.red,
                      ),
                      title: 'Dark mode',
                      subtitle: "Automatic",
                      trailing: Switch.adaptive(
                        value: false,
                        onChanged: (value) {
                          // _themeController.changeTheme(Colors.black, Colors.white);
                        },
                      ),
                    ),
                  ],
                ),
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.info,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.purple,
                      ),
                      title: 'About',
                      // subtitle: "Learn more about Mengo Delivery App",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.share,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.green,
                      ),
                      title: 'Share',
                      // subtitle: "Learn more about Ziar'App",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.book,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.amber,
                      ),
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
                        controller.logout(context);
                      },
                      icons: Icons.logout,
                      title: "Sign Out",
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
}
