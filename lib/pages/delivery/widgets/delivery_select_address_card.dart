import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/pages/delivery/delivery_sender_info_fill_page.dart';
import 'package:mengo_delivery/pages/delivery/widgets/delivery_receiver_info_fill_page.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:mengo_delivery/utils/app_images.dart';
import 'package:nb_utils/nb_utils.dart';

class DeliverySelectAddressCard extends StatelessWidget {
  const DeliverySelectAddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 2),
      child: Card(
        // clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black.withOpacity(0.5),

        shape: RoundedRectangleBorder(
          // side: BorderSide(color: blackColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 30.0,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    pickupAddress,
                    color: blackColor,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "ယူဆောင်ရန်: ",
                    style: boldTextStyle(
                        color: blackColor, weight: FontWeight.bold, size: 16),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const DeliverySenderInfoFillPage()),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      arrowDown,
                      color: blackColor,
                      height: 22.h,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "ပို့ဆောင်သူ လိပ်စာထည့်ရန်",
                      style: primaryTextStyle(
                        color: blackColor,
                        weight: FontWeight.w100,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.9),
                endIndent: 10,
                indent: 35,
              ),
              AppConstants.defaultSpacer,
              Row(
                children: [
                  SvgPicture.asset(deliverAddress, color: blackColor),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "ပို့ဆောင်ရန်: ",
                    style: boldTextStyle(
                        color: blackColor, weight: FontWeight.bold, size: 16),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const DeliveryReceiverInfoFillPage()),
                child: Row(
                  children: [
                    SizedBox(
                      width: 35.w,
                    ),
                    Text(
                      "လက်ခံသူ လိပ်စာထည့်ရန်",
                      style: primaryTextStyle(
                        color: blackColor,
                        weight: FontWeight.w100,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: whiteColor.withOpacity(0.9),
                endIndent: 10,
                indent: 35,
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const DeliveryReceiverInfoFillPage()),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Row(
                    children: [
                      Text(
                        "Add To Way ",
                        style: primaryTextStyle(
                            color: blackColor,
                            size: 14,
                            weight: FontWeight.normal),
                      ),
                      const Icon(
                        Icons.add,
                        color: blackColor,
                        size: 25,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
