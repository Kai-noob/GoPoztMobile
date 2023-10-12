import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_divider.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';

import 'package:mengo_delivery/models/receiver_model.dart';

import 'package:mengo_delivery/pages/delivery/receiver/widgets/receiver_phone_widget.dart';
import 'package:mengo_delivery/pages/delivery/receiver/widgets/receiver_way_count_widget.dart';

import 'package:mengo_delivery/utils/app_constants.dart';

import 'package:nb_utils/nb_utils.dart';

import 'widgets/receiver_address_widget.dart';
import 'widgets/receiver_cash_amount_widget.dart';
import 'widgets/receiver_city_area_widget.dart';
import 'widgets/receiver_confirm_widget.dart';
import 'widgets/receiver_delivery_time_widget.dart';
import 'widgets/receiver_estimate_widget.dart';
import 'widgets/receiver_image_widget.dart';
import 'widgets/receiver_item_type_widget.dart';
import 'widgets/receiver_name_widget.dart';
import 'widgets/receiver_note_widget.dart';
import 'widgets/receiver_onlineshop_widget.dart';
import 'widgets/receiver_parcel_size_widget.dart';
import 'widgets/receiver_prepaid_widget.dart';
import 'widgets/receiver_prohibited_widget.dart';
import 'widgets/receiver_vertical_divider_widget.dart';
import 'widgets/receiver_weight_widget.dart';

class ReceiverMainPage extends StatelessWidget {
  ReceiverMainPage({super.key});
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _addressController = TextEditingController();
  // final TextEditingController _noteController = TextEditingController();
  // final TextEditingController _cashController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DeliveryController _controller = Get.find<DeliveryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipient details"),
        leading: const CustomBackButton(),
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: AppConstants.defaultPadding, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              10.verticalSpace,
              const ReceiverWayCountWidget(),
              SizedBox(
                height: 35.h,
                child: Row(
                  children: [
                    ReceiverNameWidget(
                      controller: _controller,
                    ),
                    const Expanded(
                      child: ReceiverVerticalDivider(),
                    ),
                    ReceiverPhoneWidget(
                      controller: _controller,
                    ),
                  ],
                ),
              ),
              const CustomDivider(
                color: Colors.black,
                endIndent: 15,
                indent: 15,
              ),
              ReceiverCityAreaWidget(
                controller: _controller,
              ),
              const CustomDivider(
                color: Colors.black,
                endIndent: 15,
                indent: 15,
              ),
              ReceiverAddressWidget(
                controller: _controller,
              ),
              const CustomDivider(
                color: Colors.black,
                endIndent: 15,
                indent: 15,
              ),
              ReceiverDeliveryTimeWidget(controller: _controller)
            ]),
          ),
          const CustomVerticalSpacer(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Percel details",
                      style: TextStyle(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35.h,
                child: Row(
                  children: [
                    ReceiverItemTypeWidget(controller: _controller),
                    const ReceiverVerticalDivider(),
                    ReceiverPrepaidWidget(controller: _controller),
                  ],
                ),
              ),
              const CustomDivider(
                color: Colors.black,
                endIndent: 15,
                indent: 15,
              ),
              SizedBox(
                height: 35.h,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        ReceiverParcelSizeWidget(
                          controller: _controller,
                        ),
                        const Expanded(child: ReceiverVerticalDivider()),
                        ReceiverWeightWidget(controller: _controller),
                      ],
                    )),
              ),
              const CustomDivider(
                color: Colors.black,
                endIndent: 15,
                indent: 15,
              ),
              ReceiverCashAmountWidget(
                controller: _controller,
              ),
              const CustomDivider(
                color: Colors.black,
                endIndent: 15,
                indent: 15,
              ),
              const ReceiverOnlineShopWidget(),
              const CustomVerticalSpacer(height: 15),
              const ReceiverImageWidget(),
              const ReceiverProhibitedWidget(),
              const CustomVerticalSpacer(height: 10),
              ReceiverNoteWidget(
                controller: _controller,
              ),
              const CustomVerticalSpacer(height: 8),
            ]),
          )
        ]),
      ),
      bottomNavigationBar: SizedBox(
        height: 55.h,
        child: Row(children: [
          const ReceiverEstimationWidget(),
          ReceiverConfirmWidget(
            onTap: () {
              if (!_formKey.currentState!.validate()) {
                return; // Exit early if form validation fails.
              }

              if (_controller.receiverCityName.isEmpty ||
                  _controller.receiverTownshipName.isEmpty) {
                IconSnackBar.show(
                  context: context,
                  label: "Please Select City And Township",
                  snackBarType: SnackBarType.alert,
                );
                return;
              }

              if (_controller.parcelSize.isEmpty) {
                IconSnackBar.show(
                  context: context,
                  label: "Please Select Parcel Size",
                  snackBarType: SnackBarType.alert,
                );
                return; // Exit early if parcel size is not selected.
              }
              if (_controller.selectedCategory.name.isEmpty) {
                IconSnackBar.show(
                  context: context,
                  label: "Please Select Item Type",
                  snackBarType: SnackBarType.alert,
                );
                return; // Exit early if parcel size is not selected.
              }

              _controller.saveReceiverForm(
                ReceiverModel(
                  name: _controller.receiverName,
                  phone: _controller.receiverNumber,
                  cityId: _controller.receiverCityId,
                  townshipId: _controller.receiverTownshipId,
                  street: _controller.receiverAddress,
                  description: _controller.receiverNote,
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
