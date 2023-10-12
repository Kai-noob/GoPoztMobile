import 'package:flutter/material.dart';


class ReceiverProhibitedWidget extends StatelessWidget {
  const ReceiverProhibitedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: const Icon(
          Icons.warning,
          color: Colors.red,
        ),
        onPressed: () {},
        label: const Text(
          "View prohibited item",
          style: TextStyle(color: Colors.red),
        ));
  }
}