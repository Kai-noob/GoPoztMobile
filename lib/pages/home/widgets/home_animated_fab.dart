import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/pages/buy/buy_main_page.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/app_colors.dart';
import '../../delivery/delivery_main_page.dart';

class HomeAnimatedFAB extends StatefulWidget {
  final double actionBoxHeight;
  final double actionBoxWidth;
  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final int durationInMilliseconds;
  final double buttonDistanceFromButton;
  final double buttonBorderRadius;
  // final bool isWidgetShowed;

  const HomeAnimatedFAB({
    super.key,
    this.actionBoxHeight = 200,
    this.actionBoxWidth = 200,
    this.buttonColor = Colors.blue,
    this.buttonHeight = 60,
    this.buttonWidth = 60,
    this.durationInMilliseconds = 300,
    this.buttonDistanceFromButton = 15,
    this.buttonBorderRadius = 18,
    // this.isWidgetShowed
  });
  @override
  State<HomeAnimatedFAB> createState() => _HomeAnimatedFABState();
}

class _HomeAnimatedFABState extends State<HomeAnimatedFAB>
    with SingleTickerProviderStateMixin {
  bool _isButtonPressed = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationInMilliseconds),
    );
  }

  void _toggleAnimation() {
    setState(() {
      _isButtonPressed = !_isButtonPressed;
      if (_isButtonPressed) {
        _animationController.forward();
      } else {
        _animationController.reverse().then((_) {
          setState(() {
            isWidgetShowed = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool isWidgetShowed = false;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: _isButtonPressed
            ? ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0)
            : ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRect(
                    child: AnimatedContainer(
                      duration:
                          Duration(milliseconds: widget.durationInMilliseconds),
                      curve: Curves.easeInOut,
                      width: _isButtonPressed ? widget.actionBoxWidth : 0,
                      height: _isButtonPressed ? widget.actionBoxHeight : 0,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius:
                            BorderRadius.circular(widget.buttonBorderRadius),
                      ),
                      child: _isButtonPressed
                          ? OverflowBox(
                              maxHeight: widget.actionBoxHeight,
                              maxWidth: widget.actionBoxWidth,
                              child: SizedBox(
                                height: double.infinity,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 10.h),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          backgroundColor: primaryColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isWidgetShowed = false;
                                            _isButtonPressed = false;
                                          });
                                          Get.to(() => const BuyMainPage());
                                        },
                                        label: Text(
                                          "ဘာမဆိုဝယ်မယ်",
                                          style: boldTextStyle(
                                              color: whiteColor,
                                              size: 13,
                                              weight: FontWeight.bold),
                                        ),
                                        icon: Image.asset(
                                          "assets/icons/buyer.png",
                                          height: 23,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 10.h),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          backgroundColor: primaryColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isWidgetShowed = false;
                                            _isButtonPressed = false;
                                          });
                                          Get.to(
                                              () => const DeliveryMainPage());
                                        },
                                        label: Text(
                                          "ဘာမဆိုပို့မယ်",
                                          style: boldTextStyle(
                                              color: whiteColor,
                                              size: 13,
                                              weight: FontWeight.bold),
                                        ),
                                        icon: Image.asset(
                                          "assets/icons/delivery_man.png",
                                          height: 23,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]),
                              ),
                            )
                          : null,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: widget.buttonDistanceFromButton),
                    height: widget.buttonHeight,
                    width: widget.buttonWidth,
                    decoration: BoxDecoration(
                      color: widget.buttonColor,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: IconButton(
                      icon: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _animationController.value * 0.5 * 3.1415,
                            child: child,
                          );
                        },
                        child: Icon(
                          _isButtonPressed ? Icons.close : Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: _toggleAnimation,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
