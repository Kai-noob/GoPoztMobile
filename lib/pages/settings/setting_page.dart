import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:mengo_delivery/controllers/profile_controller.dart';


class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final ProfileController _profileController = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // User card
            BigUserCard(
              // cardColor: Colors.red,
              userName: "Babacar Ndong",
              userProfilePic: const AssetImage("assets/images/profile.jpeg"),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Modify",
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
                    value:false,
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
              settingsGroupTitleStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              items: [
                SettingsItem(
                  onTap: () {
                    _profileController.logout(context);
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
    );
  }
}
