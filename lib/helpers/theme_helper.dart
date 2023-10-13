import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mengo_delivery/utils/app_colors.dart' hide viewLineColor;
import 'package:nb_utils/nb_utils.dart';

class ThemeHelper {
  static final ThemeData lightTheme = ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
          // scaffoldBackgroundColor: Colors.white,
          // fontFamily: GoogleFonts.nunito(fontWeight: FontWeight.w500,fontSize: 15).fontFamily,
          fontFamily:
              GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)
                  .fontFamily,
          iconTheme: const IconThemeData(color: Colors.black),
          dialogBackgroundColor: Colors.white,
          unselectedWidgetColor: Colors.grey,
          dividerColor: viewLineColor,
          cardColor: Colors.white,
          // tabBarTheme: const TabBarTheme(labelColor: Colors.black),
          appBarTheme: AppBarTheme(
            color: primaryColor,
            elevation: 10,
            titleTextStyle: TextStyle(
              fontFamily:
                  GoogleFonts.poppins( fontWeight: FontWeight.w600)
                      .fontFamily,
              fontSize: 16.sp,
              // fontSize: 16.sp,
              // fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: primaryColor),
          ),
          dialogTheme: DialogTheme(shape: dialogShape()),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.white),
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedLabelStyle: boldTextStyle(color: Colors.white),
              unselectedLabelStyle: boldTextStyle(color: Colors.grey),
              selectedItemColor: black,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              unselectedItemColor: grey))
      .copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  // static final ThemeData darkTheme = ThemeData(
  //   primaryColor: primaryColor,
  //   scaffoldBackgroundColor: scaffoldDarkColor,
  //   fontFamily: GoogleFonts.roboto().fontFamily,
  //   iconTheme: const IconThemeData(color: Colors.white),
  //   dialogBackgroundColor: scaffoldSecondaryDark,
  //   unselectedWidgetColor: Colors.white60,
  //   dividerColor: Colors.white12,
  //   cardColor: scaffoldSecondaryDark,
  //   tabBarTheme: const TabBarTheme(labelColor: Colors.white),
  //   appBarTheme: const AppBarTheme(
  //     color: scaffoldSecondaryDark,
  //     elevation: 0,
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarIconBrightness: Brightness.light,
  //       statusBarColor: scaffoldSecondaryDark,
  //     ),
  //   ),
  //   dialogTheme: DialogTheme(shape: dialogShape()),
  //   snackBarTheme: const SnackBarThemeData(backgroundColor: appButtonColorDark),
  //   bottomSheetTheme:
  //       const BottomSheetThemeData(backgroundColor: appButtonColorDark),
  //   colorScheme: const ColorScheme.dark(
  //     primary: primaryColor,
  //   ),
  // ).copyWith(
  //   pageTransitionsTheme: const PageTransitionsTheme(
  //     builders: <TargetPlatform, PageTransitionsBuilder>{
  //       TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  //       TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
  //       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  //     },
  //   ),
  // );
}
