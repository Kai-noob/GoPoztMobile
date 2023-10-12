import 'package:flutter/material.dart';
import 'package:iconoir_flutter/phone.dart';

import '../../../utils/app_colors.dart';

class ODDeliveryPersonWidget extends StatelessWidget {
  const ODDeliveryPersonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(
          backgroundColor: primaryColor,
          backgroundImage: AssetImage("assets/images/profile.jpeg"),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Theme.of(context).cardColor,
        title: const Text("U Nay Yair Linn"),
        trailing: const Phone());
  }
}
