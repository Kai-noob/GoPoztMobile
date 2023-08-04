import 'package:flutter/material.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../components/appbar_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Setting",
        isBackIconShow: false,
        onBackIconPressed: () {},
      ),
      body: ListView(padding: AppConstants.defaultPadding, children: [
        // AppConstants.defaultSpacer,
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("Kyaw Kyaw"), Text("09783150477")],
              ),
            ),
          ],
        ),
        AppConstants.defaultSpacer,
        ListTile(
          leading: const Icon(
            Icons.info_outline,
            color: black,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {},
            color: black,
            iconSize: 12,
          ),
          title: Text("အကြောင်း",
              style: primaryTextStyle(
                  color: black, size: 13, weight: FontWeight.bold)),
        ),
        ListTile(
          leading: const Icon(
            Icons.share_outlined,
            color: black,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {},
            color: black,
            iconSize: 12,
          ),
          title: Text("မျှဝေမည်",
              style: primaryTextStyle(
                  color: black, size: 13, weight: FontWeight.bold)),
        ),
         ListTile(
          leading: const Icon(
            Icons.share_outlined,
            color: black,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {},
            color: black,
            iconSize: 12,
          ),
          title: Text("မျှဝေမည်",
              style: primaryTextStyle(
                  color: black, size: 13, weight: FontWeight.bold)),
        ),
        ListTile(
          leading: const Icon(
            Icons.logout_outlined,
            color: black,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {},
            color: black,
            iconSize: 12,
          ),
          title: Text("အကောင့်မှထွက်မည်",
              style: primaryTextStyle(
                  color: black, size: 13, weight: FontWeight.bold)),
        ),
      ]),
    );
  }
}
