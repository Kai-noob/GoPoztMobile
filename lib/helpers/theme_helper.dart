import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mengo_delivery/utils/app_colors.dart' hide viewLineColor;
import 'package:nb_utils/nb_utils.dart';

class ThemeHelper {
  static final ThemeData lightTheme = ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.notoSansMyanmar().fontFamily,
          iconTheme: const IconThemeData(color: Colors.black),
          dialogBackgroundColor: Colors.white,
          unselectedWidgetColor: Colors.grey,
          dividerColor: viewLineColor,
          cardColor: Colors.white,
          tabBarTheme: const TabBarTheme(labelColor: Colors.black),
          appBarTheme: const AppBarTheme(
            color: primaryColor,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
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
              selectedLabelStyle: boldTextStyle(color: Colors.black),
              unselectedLabelStyle: boldTextStyle(color: Colors.grey),
              selectedItemColor: Colors.black,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.black))
      .copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldDarkColor,
    fontFamily: GoogleFonts.roboto().fontFamily,
    iconTheme: const IconThemeData(color: Colors.white),
    dialogBackgroundColor: scaffoldSecondaryDark,
    unselectedWidgetColor: Colors.white60,
    dividerColor: Colors.white12,
    cardColor: scaffoldSecondaryDark,
    tabBarTheme: const TabBarTheme(labelColor: Colors.white),
    appBarTheme: const AppBarTheme(
      color: scaffoldSecondaryDark,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: scaffoldSecondaryDark,
      ),
    ),
    dialogTheme: DialogTheme(shape: dialogShape()),
    snackBarTheme: const SnackBarThemeData(backgroundColor: appButtonColorDark),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: appButtonColorDark),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
