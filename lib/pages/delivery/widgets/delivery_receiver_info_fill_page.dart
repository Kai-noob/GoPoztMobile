import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/appbar_widget.dart';
import 'package:mengo_delivery/components/custom_button_widget.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:mengo_delivery/utils/app_constants.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:nb_utils/nb_utils.dart';

class DeliveryReceiverInfoFillPage extends StatefulWidget {
  const DeliveryReceiverInfoFillPage({super.key});

  @override
  State<DeliveryReceiverInfoFillPage> createState() =>
      _DeliveryReceiverInfoFillPageState();
}

class _DeliveryReceiverInfoFillPageState
    extends State<DeliveryReceiverInfoFillPage> {
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

  final List<String> _amounts = ['1', '2', '3', '4'];
  String _selectedAmount = "4";

  final List<String> _categories = [
    'အစားအသောက်',
    'အဝတ်အထည်',
    'လူသုံးကုန်ပစ္စည်းများ',
    'ဆေးဝါး'
  ];
  String _selectedCategory = "အစားအသောက်";

  bool isBroke = false;
  bool isPrePay = false;
  bool isToday = false;
  int weight = 3;

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
          padding: const EdgeInsets.only(left: 35, top: 12),
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                hintStyle: primaryTextStyle(
                    color: grey, weight: FontWeight.normal, size: 12),
                hintText: "အမည်ဖြည့်ပါ",
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                hintStyle: primaryTextStyle(
                    color: grey, weight: FontWeight.normal, size: 13),
                hintText: "ဖုန်းနံပတ်ဖြည့်ပါ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        AppConstants.defaultSpacer,
        const Divider(
          color: grey,
          indent: 30,
          endIndent: 30,
        ),
        AppConstants.defaultSpacer,
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
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: Text(
            "ပို့ဆောင်မှုလမ်းညွှန်ချက်",
            style: boldTextStyle(size: 12, weight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, bottom: 10),
          child: Text(
            "သင့်လိပ်စာနှင့်ပတ်သက်သောအမှာစာရေးရန်(လိုအပ်ပါက)",
            style: boldTextStyle(size: 12, weight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: AppTextField(
            textFieldType: TextFieldType.NAME,
            textStyle: primaryTextStyle(
                color: grey, weight: FontWeight.normal, size: 12),
            decoration: InputDecoration(
                hintText: "မှတ်ချက်",
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
            "ပစ္စည်းအချက်အလက်များ",
            style: primaryTextStyle(
                color: grey, size: 12, weight: FontWeight.normal),
          ),
        ),
        AppConstants.defaultSpacer,
        Row(
          children: [
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: DropdownButtonFormField<String>(
                  items: _categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                  style: primaryTextStyle(
                      color: grey, weight: FontWeight.normal, size: 12),
                  decoration: InputDecoration(
                      hintText: "ပစ္စည်းအမျိုးအစား",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      hintStyle: primaryTextStyle(
                          color: grey, weight: FontWeight.normal, size: 13),
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
                child: DropdownButtonFormField<String>(
                  items: _amounts.map((amount) {
                    return DropdownMenuItem<String>(
                      value: amount,
                      child: Text(amount),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedAmount = value!;
                    });
                  },
                  style: primaryTextStyle(
                      color: grey, weight: FontWeight.normal, size: 12),
                  decoration: InputDecoration(
                      hintText: "အရေအတွက်",
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "အလေးချိန်",
                style: boldTextStyle(
                    size: 12, color: black, weight: FontWeight.normal),
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          weight++;
                        });
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 18,
                      )),
                  Text(
                    "${weight.toString()} Kg",
                    style: boldTextStyle(
                        color: blackColor, size: 12, weight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          weight--;
                        });
                      },
                      icon: const Icon(Icons.remove_circle_outline, size: 18)),
                ],
              ))
            ],
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      MSHCheckbox(
                        size: 20,
                        value: isBroke,
                        colorConfig:
                            MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: primaryColor,
                        ),
                        style: MSHCheckboxStyle.fillScaleColor,
                        onChanged: (selected) {
                          setState(() {
                            isBroke = selected;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "ကွဲတတ်သည်",
                        style:
                            boldTextStyle(size: 12, weight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      MSHCheckbox(
                        size: 20,
                        value: isPrePay,
                        colorConfig:
                            MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: primaryColor,
                        ),
                        style: MSHCheckboxStyle.fillScaleColor,
                        onChanged: (selected) {
                          setState(() {
                            isPrePay = selected;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "ငွေကောက်ရန်",
                        style:
                            boldTextStyle(size: 12, weight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        AppConstants.defaultSpacer,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Row(
            children: [
              MSHCheckbox(
                size: 20,
                value: isToday,
                colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                  checkedColor: primaryColor,
                ),
                style: MSHCheckboxStyle.fillScaleColor,
                onChanged: (selected) {
                  setState(() {
                    isToday = selected;
                  });
                },
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "နေ့ခြင််းပြီး",
                style: boldTextStyle(size: 12, weight: FontWeight.normal),
              ),
            ],
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
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          child: Text(
            "ပျောက်ဆုံးသော (သို့) ပျက်စီးသော \n ပါဆယ်များအတွက် \n ၃၀၀,၀၀၀ကျပ် အထိ ပြန်လည်ပေးအပ်ပါမည်။",
            textAlign: TextAlign.center,
            style: boldTextStyle(
                size: 15, weight: FontWeight.normal, color: primaryColor),
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
