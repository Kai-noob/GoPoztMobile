import 'package:flutter/material.dart';


class ODSenderAddressWidget extends StatelessWidget {
  const ODSenderAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Theme.of(context).cardColor,
      title: const Text("Sender Address"),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text("26th Street,AungMyayTharZan,Mandalay"),
      ),
    );
  }
}