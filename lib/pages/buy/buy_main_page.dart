import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/appbar_widget.dart';
import 'package:mengo_delivery/components/custom_button_widget.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/app_colors.dart';

class BuyMainPage extends StatefulWidget {
  const BuyMainPage({super.key});

  @override
  State<BuyMainPage> createState() => _BuyMainPageState();
}

class _BuyMainPageState extends State<BuyMainPage> {
  final List<String> _states = [
    'ရန်ကုန်',
    'မကွေး',
  ];
  String _selectedState = "ရန်ကုန်";
  final List<String> _cities = [
    'လှိုင်',
    'မရမ်းကုန်း',
    'ကြည့်မြင်တိုင်',
    'အလုံ'
  ];
  String _selectedCities = "လှိုင်";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Mengo Delivery",
        isBackIconShow: true,
        onBackIconPressed: () {
          Get.back();
        },
      ),
      body: ListView(children: [
        Padding(
          padding: AppConstants.defaultPadding,
          child: Text(
            "လက်ခံသူအချက်အလက်များဖြည့်ပါ",
            style: boldTextStyle(
                color: blackColor, size: 16, weight: FontWeight.normal),
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            "လက်ခံသူ",
            style: primaryTextStyle(
                color: grey, size: 12, weight: FontWeight.normal),
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: AppTextField(
            textFieldType: TextFieldType.NAME,
            textStyle: primaryTextStyle(
                color: grey, weight: FontWeight.normal, size: 12),
            decoration: InputDecoration(
                hintText: "အမည်ဖြည့်ပါ",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                hintStyle: primaryTextStyle(
                    color: grey, weight: FontWeight.normal, size: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: AppTextField(
            textFieldType: TextFieldType.NUMBER,
            textStyle: primaryTextStyle(
                color: grey, weight: FontWeight.normal, size: 12),
            decoration: InputDecoration(
                hintText: "ဖုန်းနံပတ်ဖြည့်ပါ",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                hintStyle: primaryTextStyle(
                    color: grey, weight: FontWeight.normal, size: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        const Divider(
          color: grey,
          indent: 30,
          endIndent: 30,
        ),
        SizedBox(
          height: 4.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            "နေရပ်လိပ်စာ",
            style: primaryTextStyle(
                color: grey, size: 12, weight: FontWeight.normal),
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: DropdownButtonFormField<String>(
            items: _states.map((state) {
              return DropdownMenuItem<String>(
                value: state,
                child: Text(state),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedState = value!;
              });
            },
            style: primaryTextStyle(
                color: grey, weight: FontWeight.normal, size: 12),
            decoration: InputDecoration(
                hintText: "တိုင်း/ပြည်နယ်",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                hintStyle: primaryTextStyle(
                    color: grey, weight: FontWeight.normal, size: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        AppConstants.defaultSpacer,
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: DropdownButtonFormField<String>(
                  items: _cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCities = value!;
                    });
                  },
                  style: primaryTextStyle(
                      color: grey, weight: FontWeight.normal, size: 12),
                  decoration: InputDecoration(
                      hintText: "မြို့နယ်",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      hintStyle: primaryTextStyle(
                          color: grey, weight: FontWeight.normal, size: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 35),
                child: AppTextField(
                  textFieldType: TextFieldType.NAME,
                  textStyle: primaryTextStyle(
                      color: grey, weight: FontWeight.normal, size: 12),
                  decoration: InputDecoration(
                      hintText: "ရပ်ကွက်",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      hintStyle: primaryTextStyle(
                          color: grey, weight: FontWeight.normal, size: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
          ],
        ),
        AppConstants.defaultSpacer,
        Row(
          children: [
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: AppTextField(
                  textFieldType: TextFieldType.NAME,
                  textStyle: primaryTextStyle(
                      color: grey, weight: FontWeight.normal, size: 12),
                  decoration: InputDecoration(
                      hintText: "လမ်း",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      hintStyle: primaryTextStyle(
                          color: grey, weight: FontWeight.normal, size: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 35),
                child: AppTextField(
                  textFieldType: TextFieldType.NAME,
                  textStyle: primaryTextStyle(
                      color: grey, weight: FontWeight.normal, size: 12),
                  decoration: InputDecoration(
                      hintText: "အိမ်အမှတ်",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      hintStyle: primaryTextStyle(
                          color: grey, weight: FontWeight.normal, size: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        const Divider(
          color: grey,
          indent: 30,
          endIndent: 30,
        ),
        SizedBox(
          height: 4.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            "ဝယ်ယူမှုလမ်းညွှန်ချက်",
            style: primaryTextStyle(
                color: grey, size: 12, weight: FontWeight.normal),
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            "ဝယ်လိုသောဆိုင်၊ပစ္စည်းအမျိုးအမည်၊အရေအတွက်၊အရွယ်အစား၊အလေးချိန်နှင့်လိုအပ်သောအမှာစာရေးပေးပါရန်",
            style: primaryTextStyle(
                color: grey, size: 12, weight: FontWeight.normal),
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            style: primaryTextStyle(
                color: grey, weight: FontWeight.normal, size: 12),
            decoration: InputDecoration(
                hintText: "အမှာစာ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          child: Text(
            "မှာယူလိုသောပစ္စည်းတန်ဖိုး၏ တစ်ဝက် (သို့) အပြည့်အားကြိုရှင်းပေးပါရန် နှင့် ပစ္စည်းတန်ဖိုးများအားဘောင်ချာအလိုက်ပြန်လည်တင်ပြပေးပါမည်။",
            textAlign: TextAlign.center,
            style: boldTextStyle(
                size: 12, weight: FontWeight.normal, color: primaryColor),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        CustomButtonWidget(title: "အတည်ပြုမည်", onPressed: () {}),
        SizedBox(
          height: 20.h,
        ),
      ]),
    );
  }
}
