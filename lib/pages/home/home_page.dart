import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/appbar_widget.dart';
import 'package:mengo_delivery/models/ads_model.dart';
import 'package:mengo_delivery/pages/delivery/delivery_main_page.dart';
import 'package:mengo_delivery/pages/home/widgets/home_carousel_slider.dart';
import 'package:mengo_delivery/pages/home/widgets/home_text_widget.dart';
import 'package:mengo_delivery/pages/order/order_details_main_page.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';

import 'widgets/home_service_charge_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // GlobalKey<AnimatedFABState> fabKey = GlobalKey<AnimatedFABState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Mengo Delivery",
        isBackIconShow: false,
        onBackIconPressed: () {},
      ),
      body: ListView(children: [
        // AppConstants.defaultSpacer,
        HomeCarouselSlider(adsBanners: [
          AdsModel(
              "https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg")
        ]),
        // AppConstants.defaultSpacer,

        // AppConstants.defaultSpacer,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: GestureDetector(
                  onTap: () => Get.to(() => const DeliveryMainPage()),
                  child: Card(
                    // padding: const EdgeInsets.symmetric(vertical: 10),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   border: Border.all(color: primaryColor, width: 1.5),
                    // ),
                    elevation: 20.0,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    shadowColor: Colors.white,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/post.png",
                            height: 35,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "ပို့မယ်",
                            style: boldTextStyle(
                                color: blackColor,
                                size: 13,
                                weight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: GestureDetector(
                  onTap: () => Get.to(() => const DeliveryMainPage()),
                  child: Card(
                    elevation: 20.0,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    shadowColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/move.png",
                            height: 35,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "အိမ်ပြောင်းမယ်",
                            style: boldTextStyle(
                                color: blackColor,
                                size: 13,
                                weight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const HomeServiceChargeWidget(),
        AppConstants.defaultSpacer,
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: HomeTextWidget(text: "ယနေ့ အော်ဒါများ"),
        ),

        // HomeOrderItemWidget(
        //           dateTime: DateTime(2023, 8, 3, 21, 30), // Replace with your actual date and time
        //           status: 'Completed',
        //           delivererName: 'John Doe',
        //           pickupAddress: '123 Main Street, City A',
        //           deliveryAddress: '456 Park Avenue, City B',
        //           totalPrice: '\$50.00',
        //           onSeeMorePressed: () {
        //             // Handle "See More" button press
        //             print('See More button pressed');
        //           },
        //         ),
        AppConstants.defaultSpacer,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
          child: Card(
            elevation: 20.0,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))),
            shadowColor: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order #12323",
                          style: boldTextStyle(
                              color: blackColor,
                              size: 14,
                              weight: FontWeight.normal),
                        ),
                        Row(
                          children: [
                            Text(
                              "Completed",
                              style: primaryTextStyle(
                                  color: greenColor,
                                  weight: FontWeight.normal,
                                  size: 13),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            AppConstants.statusIcon,
                          ],
                        )
                      ]),
                ),
                const Divider(
                  color: grey,
                  thickness: 0.2,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "12-2-2023 9:00AM",
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                              style: TextButton.styleFrom(
                                  // backgroundColor: black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                Get.to(() => const OrderDetailsMainPage());
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 14,
                                color: blackColor,
                              ),
                              label: Text(
                                "အားလုံးကြည့်မည်",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: blackColor),
                              )),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
          child: Card(
            elevation: 20.0,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))),
            shadowColor: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order #12323",
                          style: boldTextStyle(
                              color: blackColor,
                              size: 14,
                              weight: FontWeight.normal),
                        ),
                        Row(
                          children: [
                            Text(
                              "Completed",
                              style: primaryTextStyle(
                                  color: greenColor,
                                  weight: FontWeight.normal,
                                  size: 13),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            AppConstants.statusIcon,
                          ],
                        )
                      ]),
                ),
                const Divider(
                  color: grey,
                  thickness: 0.2,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "12-2-2023",
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                              style: TextButton.styleFrom(
                                  // backgroundColor: black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 14,
                                color: blackColor,
                              ),
                              label: Text(
                                "အားလုံးကြည့်မည်",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: blackColor),
                              )),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
          child: Card(
            elevation: 20.0,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))),
            shadowColor: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order #12323",
                          style: boldTextStyle(
                              color: blackColor,
                              size: 14,
                              weight: FontWeight.normal),
                        ),
                        Row(
                          children: [
                            Text(
                              "Completed",
                              style: primaryTextStyle(
                                  color: greenColor,
                                  weight: FontWeight.normal,
                                  size: 13),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            AppConstants.statusIcon,
                          ],
                        )
                      ]),
                ),
                const Divider(
                  color: grey,
                  thickness: 0.2,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "12-2-2023",
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                              style: TextButton.styleFrom(
                                  // backgroundColor: black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 14,
                                color: blackColor,
                              ),
                              label: Text(
                                "အားလုံးကြည့်မည်",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: blackColor),
                              )),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ]),
      // floatingActionButton: FanFloatingMenu(
      //   toggleButtonColor: primaryColor,

      //   toggleButtonWidget: const Icon(
      //     Icons.add,
      //     color: whiteColor,
      //     size: 35,
      //   ),
      //   fanMenuDirection: FanMenuDirection.rtl,
      //   menuItems: [
      //     FanMenuItem(
      //         onTap: () {}, icon: Icons.edit_rounded, title: 'Edit Texts'),
      //     FanMenuItem(
      //         onTap: () {}, icon: Icons.save_rounded, title: 'Save Notes'),
      //     FanMenuItem(
      //         onTap: () {}, icon: Icons.send_rounded, title: 'Send Images'),
      //   ],
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: const HomeAnimatedFAB(
      //   buttonColor: primaryColor,
      //   buttonBorderRadius: 30,
      // ),
    );
  }
}
