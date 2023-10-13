import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_images.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/language_model.dart';

class AppConstants {
  static SvgPicture homeIcon = SvgPicture.asset(
    home,
    height: 19,
    color: blackColor,
  );
  static SvgPicture notiIcon = SvgPicture.asset(
    noti,
    height: 19,
    color: blackColor,
  );
  static SvgPicture historyIcon = SvgPicture.asset(
    history,
    height: 19,
    color: blackColor,
  );
  static SvgPicture settingIcon = SvgPicture.asset(
    setting,
    height: 19,
    color: blackColor,
  );
    static SvgPicture homeActiveIcon = SvgPicture.asset(
    home,
    height: 19,
    color: primaryColor,
  );
  static SvgPicture notiActiveIcon = SvgPicture.asset(
    noti,
    height: 19,
    color: primaryColor,
  );
  static SvgPicture historyActiveIcon = SvgPicture.asset(
    history,
    height: 19,
    color: primaryColor,
  );
  static SvgPicture settingActiveIcon = SvgPicture.asset(
    setting,
    height: 19,
    color: primaryColor,
  );
  static SvgPicture timeIcon = SvgPicture.asset(
    time,
    height: 20,
  );
  static SvgPicture deliverManIcon = SvgPicture.asset(
    deliveryMane,
    height: 18,
  );
  static SvgPicture statusIcon = SvgPicture.asset(
    status,
    height: 20,
    color: greenColor,
  );
  static SvgPicture pickupAddressIcon = SvgPicture.asset(pickupAddress);
  static SvgPicture deliverAddressIcon = SvgPicture.asset(deliverAddress);

  static const String languageCode = 'en';
  static const String countryCode = 'US';
  static const String theme = 'light';

  static int defaultFontSize = 16;

  static TextStyle defaultTextStyle =
      primaryTextStyle(color: blackColor, size: defaultFontSize);

  static EdgeInsetsGeometry defaultPadding =
      EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h);

  static SizedBox defaultSpacer = SizedBox(
    height: 7.h,
  );

static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: "",
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: "",
        languageName: 'Burmese',
        countryCode: 'MM',
        languageCode: 'mm'),
  ];
}
