import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/app_colors.dart';

class DeliveryOrderButton extends StatelessWidget {
  const DeliveryOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
          onPressed: () {
            showBarModalBottomSheet(
                context: context,
                builder: (BuildContext context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Way A",
                                  style: boldTextStyle(
                                      color: blackColor,
                                      size: 17,
                                      weight: FontWeight.normal)),
                              Text(
                                "၂၀၀၀ ကျပ်",
                                style: primaryTextStyle(
                                    weight: FontWeight.bold, size: 16),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Way B",
                                  style: boldTextStyle(
                                      color: blackColor,
                                      size: 17,
                                      weight: FontWeight.normal)),
                              Text(
                                "၂၀၀၀ ကျပ်",
                                style: primaryTextStyle(
                                    weight: FontWeight.bold, size: 16),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: grey,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Total",
                                  style: boldTextStyle(
                                      color: blackColor,
                                      size: 17,
                                      weight: FontWeight.normal)),
                              Text(
                                "၄၀၀၀ ကျပ်",
                                style: primaryTextStyle(
                                    weight: FontWeight.bold, size: 16),
                              ),
                            ],
                          ),
                        ),
                        AppConstants.defaultSpacer,
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.all(15)),
                              onPressed: () {},
                              child: Text(
                                "Confirm",
                                style: boldTextStyle(
                                    color: whiteColor,
                                    size: 19,
                                    weight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ));
          },
          child: Text(
            "Order တင်မည်",
            style: boldTextStyle(
                color: blackColor, size: 19, weight: FontWeight.bold),
          )),
    );
  }
}
