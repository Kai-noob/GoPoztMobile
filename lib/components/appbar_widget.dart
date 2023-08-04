import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/app_colors.dart';
import 'custom_appbar_shape.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackIconPressed;
  final bool isBackIconShow;
  const AppBarWidget({
    super.key,
    required this.title,
    required this.onBackIconPressed,
    required this.isBackIconShow,
  });

  @override
  Size get preferredSize => const Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 130,
      backgroundColor: Colors.transparent,
      leading: Container(),
      // le
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: Customshape(),
        child: Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          color: primaryColor,
          child: isBackIconShow
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: onBackIconPressed,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: blackColor,
                      ),
                    ),
                    Text(
                      title,
                      style: boldTextStyle(
                          size: 20,
                          color: blackColor,
                          fontFamily: GoogleFonts.audiowide().fontFamily),
                      textAlign: TextAlign.center,
                    ),
                    Container(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: boldTextStyle(
                          size: 20,
                          color: blackColor,
                          fontFamily: GoogleFonts.audiowide().fontFamily),
                      // textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
