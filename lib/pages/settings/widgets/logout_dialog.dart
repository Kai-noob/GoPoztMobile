import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onTap;
  const LogoutDialog({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, onTap),
    );
  }

  contentBox(BuildContext context, VoidCallback onTap) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CustomVerticalSpacer(height: 15),
              // Your logo goes here

              const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const CustomVerticalSpacer(height: 10), // Adjust the spacing
              const Text(
                "Are you sure you want to log out?",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const CustomVerticalSpacer(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onTap,
                    child: const Text(
                      "LOGOUT",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
