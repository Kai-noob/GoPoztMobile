import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/components/appbar_widget.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "History",
        isBackIconShow: false,
        onBackIconPressed: () {},
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(
          color: grey,
        ),
        // padding: AppConstants.defaultPadding,
        itemBuilder: (context, index) => Padding(
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
      ),
    );
  }
}
