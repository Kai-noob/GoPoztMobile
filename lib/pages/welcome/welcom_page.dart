import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: 250.h,

            /// 250.0
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/bg.png'),
                    fit: BoxFit.fill)),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   width: SizeConfig.screenWidth!/1.83,     /// 225.0
              //   height: SizeConfig.screenHeight!/5.174,  /// 132.0
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("assets/main/logo.png",),
              //       fit: BoxFit.cover
              //     )
              //   ),
              // ),
              Column(children: [
                Center(
                  child: Text(
                    "WELCOME",
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: SizeConfig.screenWidth! / 10.28,
                //       vertical: SizeConfig.screenHeight! / 136.6),

                //   /// 40.0 - 5.0
                //   child: const Center(
                //     child: Text(
                //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                //       style: TextStyle(color: Colors.white60),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // )
              ]),
              // LoginButton(),
              // RegisterButtonWidget()
            ],
          )
        ],
      ),
    );
  }
}
