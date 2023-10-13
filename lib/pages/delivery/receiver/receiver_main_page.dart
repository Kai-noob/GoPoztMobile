import 'package:flutter/material.dart';

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
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../../helpers/snackbar_helper.dart';
import '../../../services/api_call_status.dart';
import '../../../utils/app_colors.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryController>(builder: (controller) {
      return OverlayLoaderWithAppIcon(
        isLoading: controller.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: Image.asset('assets/icons/icon.png'),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Recipient details"),
            leading: const CustomBackButton(),
          ),
          body: Form(
            key: _formKey,
            child: ListView(padding: AppConstants.defaultPadding, children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      const ReceiverWayCountWidget(),
                      SizedBox(
                        height: 35.h,
                        child: Row(
                          children: [
                            ReceiverNameWidget(
                              controller: controller,
                            ),
                            const Expanded(
                              child: ReceiverVerticalDivider(),
                            ),
                            ReceiverPhoneWidget(
                              controller: controller,
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
                        controller: controller,
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      ReceiverAddressWidget(
                        controller: controller,
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      ReceiverDeliveryTimeWidget(controller: controller)
                    ]),
              ),
              const CustomVerticalSpacer(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            ReceiverItemTypeWidget(controller: controller),
                            const ReceiverVerticalDivider(),
                            ReceiverPrepaidWidget(controller: controller),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                ReceiverParcelSizeWidget(
                                  controller: controller,
                                ),
                                const Expanded(
                                    child: ReceiverVerticalDivider()),
                                ReceiverWeightWidget(controller: controller),
                              ],
                            )),
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      ReceiverCashAmountWidget(
                        controller: controller,
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
                        controller: controller,
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

                  if (controller.receiverCityName.isEmpty ||
                      controller.receiverTownshipName.isEmpty) {
                    SnackBarHelper.showErrorMessage(
                      context: context,
                      title: "Please Select City And Township",
                    );
                    return;
                  }

                  if (controller.parcelSize.isEmpty) {
                    SnackBarHelper.showErrorMessage(
                      context: context,
                      title: "Please Select Parcel Size",
                    );
                    return; // Exit early if parcel size is not selected.
                  }
                  if (controller.selectedCategory.name.isEmpty) {
                    SnackBarHelper.showErrorMessage(
                      context: context,
                      title: "Please Select Item Type",
                    );
                    return; // Exit early if parcel size is not selected.
                  }

                  controller.saveReceiverForm(
                    ReceiverModel(
                      name: controller.receiverName,
                      phone: controller.receiverNumber,
                      cityId: controller.receiverCityId,
                      townshipId: controller.receiverTownshipId,
                      street: controller.receiverAddress,
                      description: controller.receiverNote,
                    ),
                  );
                },
              )
            ]),
          ),
        ),
      );
    });
  }
}
