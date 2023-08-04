import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/utils/app_common.dart';

import '../../../controllers/localization_controller.dart';
import '../../../models/language_model.dart';
import '../../../utils/app_constants.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget({Key? key, required this.languageModel, required this.localizationController, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          AppConstants.languages[index].languageCode!,
          AppConstants.languages[index].countryCode,
        ));
        localizationController.setSelectIndex(index);
      },
      child: Container(
        // padding:  defaultPadding,
        // margin: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!, blurRadius: 5, spreadRadius: 1)],
        ),
        child: Stack(children: [

          Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                height: 65, width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).textTheme.bodyLarge!.color!, width: 1),
                ),
                alignment: Alignment.center,
                // child: Image.asset(
                //   languageModel.imageUrl!, width: 36, height: 36,
                //   color: languageModel.languageCode == 'en' || languageModel.languageCode == 'ar'
                //       ? Theme.of(context).textTheme.bodyLarge!.color : null,
                // ),
              ),
              // const SizedBox(height: Dimensions.paddingSizeLarge),
              Text(languageModel.languageName!),
            ]),
          ),

          localizationController.selectedIndex == index ? Positioned(
            top: 0, right: 0,
            child: Icon(Icons.check_circle, color: Theme.of(context).primaryColor, size: 25),
          ) : const SizedBox(),

        ]),
      ),
    );
  }
}
