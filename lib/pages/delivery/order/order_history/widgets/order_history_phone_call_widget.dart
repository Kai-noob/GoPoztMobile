import 'package:flutter/material.dart';
import 'package:iconoir_flutter/phone.dart';

class OrderHistoryPhoneCallWidget extends StatelessWidget {
  const OrderHistoryPhoneCallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.black,
          child: Phone(
            color: Colors.white,
          )),
    );
  }
}